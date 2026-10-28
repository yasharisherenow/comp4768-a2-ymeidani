import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/repositories/application_repository.dart';
import '../../../domain/models/application.dart';

String? validateFullName(String? value) {
  return value == null || value.trim().isEmpty ? 'Enter your full name' : null;
}

String? validatePhone(String? value) {
  return RegExp(r'^[0-9]{10}$').hasMatch(value?.trim() ?? '')
      ? null
      : 'Enter exactly 10 digits';
}

String? validateReason(String? value) {
  return (value?.trim().length ?? 0) >= 30
      ? null
      : 'Enter at least 30 characters';
}

String? validateFosterAge(String? value) {
  final age = int.tryParse(value?.trim() ?? '');
  if (age == null) return 'Enter your age as a whole number';
  return age < 18 ? 'You must be 18 or older to foster' : null;
}

final applyProvider = AsyncNotifierProvider.autoDispose<ApplyViewModel, bool>(
  ApplyViewModel.new,
);

class ApplyViewModel extends AsyncNotifier<bool> {
  @override
  bool build() => false;

  Future<void> send(Application application) async {
    state = const AsyncLoading();

    try {
      await ref.read(applicationRepositoryProvider).submit(application);

      if (!ref.mounted) return;
      state = const AsyncData(true);
    } catch (error, stackTrace) {
      if (!ref.mounted) return;
      state = AsyncError(error, stackTrace);
    }
  }
}
