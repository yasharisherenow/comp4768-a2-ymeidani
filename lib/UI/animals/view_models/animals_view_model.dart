import '../../../data/repositories/animal_repository.dart';
import '../../../domain/models/animal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final animalsProvider = StreamProvider<List<Animal>>((ref) {
  final repository = ref.watch(animalRepositoryProvider);
  return repository.watchAnimals();
}); 
