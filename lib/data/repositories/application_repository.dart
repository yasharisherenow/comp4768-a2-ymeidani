import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/application.dart';

/// The one ApplicationRepository of the app.
final applicationRepositoryProvider = Provider(
  (ref) => ApplicationRepository(),
);

/// Your applications. They live in memory for now, so a restart (or a
/// reload in Chrome) clears them.
class ApplicationRepository {
  final List<Application> _applications = [];

  /// Tells watchApplications() that the list changed.
  final _changes = StreamController<void>.broadcast();

  /// Your applications, newest first. A new list comes after every change.
  Stream<List<Application>> watchApplications() async* {
    yield List.of(_applications);
    await for (final _ in _changes.stream) {
      yield List.of(_applications);
    }
  }

  /// Sends an application. Like a server, it takes a moment.
  /// The shelter is not taking applications for Rocket this week.
  Future<void> submit(Application application) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    if (application.animalName == 'Rocket') {
      throw Exception(
        'The shelter is not taking applications for Rocket this week',
      );
    }
    _applications.insert(0, application);
    _changes.add(null);
  }

  /// Withdraws the application for this animal.
  Future<void> withdraw(String animalId) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    _applications.removeWhere((a) => a.animalId == animalId);
    _changes.add(null);
  }
}
