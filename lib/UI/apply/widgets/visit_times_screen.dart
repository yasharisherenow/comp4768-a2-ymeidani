import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../data/fake_data.dart';

class VisitTimesScreen extends StatelessWidget {
  const VisitTimesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose a visit time'),
      ),
      body: ListView.builder(
        itemCount: visitTimes.length,
        itemBuilder: (context, index) {
          final time = visitTimes[index];

          return ListTile(
            title: Text(time),
            onTap: () => context.pop(time),
          );
        },
      ),
    );
  }
}