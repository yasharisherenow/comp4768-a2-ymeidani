import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/models/animal.dart';
import '../../animals/view_models/animals_view_model.dart';
import '../view_models/animal_view_model.dart';

class AnimalScreen extends ConsumerWidget {
  const AnimalScreen({super.key, required this.animalId});

  final String animalId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animals = ref.watch(animalsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Animal details')),
      body: animals.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
        data: (animals) {
          final animal = animals
              .where((animal) => animal.id == animalId)
              .firstOrNull;

          if (animal == null) {
            return const Center(child: Text('Animal not found'));
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  animal.name,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 12),
                Text('Species: ${animal.species.name}'),
                Text('Breed: ${animal.breed}'),
                Text('Sex: ${animal.sex}'),
                Text('Age: ${ageText(animal.ageMonths)}'),
                const SizedBox(height: 16),
                Text(animal.description),
                const SizedBox(height: 16),
                if (animal.need == Need.foster) ...[
                  Text(animal.fosterReason ?? ''),
                  const SizedBox(height: 8),
                  const Text(
                    'Fostering is free, and the shelter provides all supplies.',
                  ),
                ] else
                  Text('Adoption fee: ${feeText(animal)}'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => context.go('/animals/${animal.id}/apply'),
                  child: Text(
                    animal.need == Need.foster
                        ? 'Apply to foster'
                        : 'Apply to adopt',
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
