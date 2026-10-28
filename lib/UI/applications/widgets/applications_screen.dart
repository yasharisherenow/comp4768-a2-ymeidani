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

    return Scaffold(
      appBar: AppBar(title: const Text('My Applications')),
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
