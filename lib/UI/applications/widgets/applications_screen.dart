import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/models/animal.dart';
import '../view_models/applications_view_model.dart';

class ApplicationsScreen extends ConsumerWidget {
  const ApplicationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final applications = ref.watch(applicationsProvider);
    final withdrawal = ref.watch(withdrawProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('My Applications')),
      bottomNavigationBar: withdrawal.when(
        loading: () => const Padding(
          padding: EdgeInsets.all(16),
          child: Center(heightFactor: 1, child: CircularProgressIndicator()),
        ),
        error: (error, stackTrace) => Padding(
          padding: const EdgeInsets.all(16),
          child: Text('Withdrawal failed: $error'),
        ),
        data: (_) => const SizedBox.shrink(),
      ),
      body: applications.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
        data: (applications) {
          if (applications.isEmpty) {
            return const Center(child: Text('No applications yet'));
          }

          return ListView.builder(
            itemCount: applications.length,
            itemBuilder: (context, index) {
              final application = applications[index];
              return ListTile(
                trailing: TextButton(
                  onPressed: () async {
                    final confirmed = await showDialog<bool>(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Confirm Withdrawal'),
                        content: const Text(
                          'Are you sure you want to withdraw your application?',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => context.pop(false),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () => context.pop(true),
                            child: const Text('Withdraw'),
                          ),
                        ],
                      ),
                    );
                    if (!context.mounted || confirmed != true) return;
                    await ref
                        .read(withdrawProvider.notifier)
                        .withdraw(application.animalId);
                  },
                  child: const Text('Withdraw'),
                ),
                title: Text(application.animalName),
                subtitle: Text(
                  '${application.need == Need.adoption ? 'Adopt' : 'Foster'}'
                  ' • ${application.visitTime}',
                ),
                onTap: () => context.go('/animals/${application.animalId}'),
              );
            },
          );
        },
      ),
    );
  }
}
