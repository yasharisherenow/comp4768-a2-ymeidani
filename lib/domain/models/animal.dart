/// The kinds of animal in the catalogue. The names are used in the URL:
/// /animals?species=cat
enum Species { cat, dog, other }

/// What the shelter is looking for: an adopter, or a foster home.
/// The names are used in the URL: /animals?need=foster
enum Need { adoption, foster }

class Animal {
  const Animal({
    required this.id,
    required this.name,
    required this.species,
    required this.breed,
    required this.sex,
    required this.ageMonths,
    required this.description,
    required this.need,
    this.fosterReason,
  });

  final String id;
  final String name;
  final Species species;
  final String breed;
  final String sex; // 'Female' or 'Male'
  final int ageMonths;
  final String description;
  final Need need;

  /// Why the animal needs a foster home. Only set when [need] is [Need.foster].
  final String? fosterReason;
}
