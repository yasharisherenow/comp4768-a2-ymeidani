import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/repositories/application_repository.dart';
import '../../../domain/models/application.dart';

final applicationsProvider = StreamProvider<List<Application>>((ref) {
  final repository = ref.watch(applicationRepositoryProvider);
  return repository.watchApplications();
});
final withdrawProvider =
    AsyncNotifierProvider.autoDispose<WithdrawViewModel, void>(
  WithdrawViewModel.new,
);

class WithdrawViewModel extends AsyncNotifier<void> {
  @override
  void build() {}

  Future<void> withdraw(String animalId) async {
    state = const AsyncLoading();

    try {
      await ref.read(applicationRepositoryProvider).withdraw(animalId);

      if (!ref.mounted) return;
      state = const AsyncData(null);
    } catch (error, stackTrace) {
      if (!ref.mounted) return;
      state = AsyncError(error, stackTrace);
    }
  }
}