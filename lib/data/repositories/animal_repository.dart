import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/animal.dart';
import '../fake_data.dart';
const failForDemo = false;
final animalRepositoryProvider = Provider<AnimalRepository>(
  (ref) => AnimalRepository(),
);
class AnimalRepository {
  Stream<List<Animal>> watchAnimals() async* {
    // Simulate waiting for a server response.
    await Future<void>.delayed(const Duration(seconds: 1));

    if (failForDemo) {
      throw Exception('Could not reach the shelter');
    }

    yield fakeAnimals;
  }
}