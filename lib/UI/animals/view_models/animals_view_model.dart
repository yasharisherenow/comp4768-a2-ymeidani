import '../../../data/repositories/animal_repository.dart';
import '../../../domain/models/animal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final animalsProvider = StreamProvider<List<Animal>>((ref) {
  final repository = ref.watch(animalRepositoryProvider);
  return repository.watchAnimals();
}); 
String ageText(int months) {
  if (months < 12) {
    return '$months ${months == 1 ? 'month' : 'months'}';
  }

  final years = months ~/ 12;
  return '$years ${years == 1 ? 'year' : 'years'}';
}
List<Animal> filterAnimals(List<Animal> animals, String? species, String? need) {
  final selectedSpecies = Species.values.asNameMap()[species];
  return animals.where((animal) {
    final matchesSpecies = selectedSpecies == null || animal.species == selectedSpecies;
    final matchesNeed = need != "foster" || animal.need == Need.foster;
    return matchesSpecies && matchesNeed;
  }).toList();
}
