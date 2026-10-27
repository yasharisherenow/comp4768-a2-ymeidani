import 'animal.dart';

/// One application to adopt or foster an animal. There is at most one
/// application for each animal, so the animal's id says which one it is.
class Application {
  const Application({
    required this.animalId,
    required this.animalName,
    required this.need,
    required this.fullName,
    required this.phone,
    required this.visitTime,
    this.reason,
  });

  final String animalId;
  final String animalName;

  /// Need.adoption: an application to adopt. Need.foster: to foster.
  final Need need;

  final String fullName;
  final String phone;
  final String visitTime;

  /// Why the animal is a good match. Only for adoption.
  final String? reason;
}
