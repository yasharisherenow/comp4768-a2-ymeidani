import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../view_models/animals_view_model.dart';

class AnimalsScreen extends ConsumerWidget {
  const AnimalsScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animals = ref.watch(animalsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Animals'),
      ),
      body: animals.when(
        data: (animals) => ListView.builder(
          itemCount: animals.length,
          itemBuilder: (context, index) {
            final animal = animals[index];
            return ListTile(
              title: Text(animal.name),
              subtitle: Text('${animal.breed} • ${animal.sex}'),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }
}