import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/repositories/application_repository.dart';
import '../../../domain/models/application.dart';

final applicationsProvider = StreamProvider<List<Application>>((ref) {
  final repository = ref.watch(applicationRepositoryProvider);
  return repository.watchApplications();
});
