import '../../../domain/models/animal.dart';

String feeText(Animal animal) {
  switch (animal.species) {
    case Species.cat:
      if (animal.ageMonths <= 6) {
        return '\$275';
      }
      if (animal.ageMonths < 132) {
        return '\$200';
      }
      return '\$175';

    case Species.dog:
      if (animal.ageMonths <= 6) {
        return '\$375';
      }
      if (animal.ageMonths < 108) {
        return '\$275';
      }
      return '\$200';

    case Species.other:
      return 'Ask the shelter about the fee';
  }
}