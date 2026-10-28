import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../view_models/animals_view_model.dart';
import '../../../domain/models/animal.dart';

import 'package:go_router/go_router.dart';

class AnimalsScreen extends ConsumerWidget {
  const AnimalsScreen({super.key, this.species, this.need});
  final String? species;
  final String? need;
  void updateFilters(
    BuildContext context,
    String? selectedSpecies,
    bool fosterOnly,
  ) {
    final query = <String, String>{
      'species': ?selectedSpecies,
      if (fosterOnly) 'need': 'foster',
    };

    context.go(
      Uri(
        path: '/animals',
        queryParameters: query.isEmpty ? null : query,
      ).toString(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animals = ref.watch(animalsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Animals'),
        actions: [
          IconButton(
            tooltip: 'My Applications',
            icon: const Icon(Icons.assignment_outlined),
            onPressed: () => context.go('/animals/applications'),
          ),
        ],
      ),
      body: animals.when(
        data: (animals) {
          final filteredAnimals = filterAnimals(animals, species, need);
          final selectedSpecies = Species.values.asNameMap()[species];
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    ChoiceChip(
                      label: const Text('All'),
                      selected: selectedSpecies == null,
                      onSelected: (_) =>
                          updateFilters(context, null, need == 'foster'),
                    ),
                    for (final entry in {
                      'cat': 'Cats',
                      'dog': 'Dogs',
                      'other': 'Other',
                    }.entries)
                      ChoiceChip(
                        label: Text(entry.value),
                        selected: selectedSpecies?.name == entry.key,
                        onSelected: (_) =>
                            updateFilters(context, entry.key, need == 'foster'),
                      ),
                    FilterChip(
                      label: const Text('Needs a foster home'),
                      selected: need == 'foster',
                      onSelected: (selected) => updateFilters(
                        context,
                        selectedSpecies?.name,
                        selected,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredAnimals.length,
                  itemBuilder: (context, index) {
                    final animal = filteredAnimals[index];
                    return ListTile(
                      onTap: () => context.go('/animals/${animal.id}'),
                      leading: Icon(switch (animal.species) {
                        Species.cat => Icons.pets,
                        Species.dog => Icons.pets,
                        Species.other => Icons.cruelty_free,
                      }),
                      title: Text(animal.name),
                      subtitle: Text(
                        '${animal.breed} • ${animal.sex} • ${ageText(animal.ageMonths)}',
                      ),
                      trailing: animal.need == Need.foster
                          ? const Text("Needs a foster home")
                          : null,
                    );
                  },
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
