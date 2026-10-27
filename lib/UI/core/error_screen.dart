import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, required this.address});

  final String address;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page not found')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Page not found: $address'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => context.go('/animals'),
                child: const Text('Go to animals'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
