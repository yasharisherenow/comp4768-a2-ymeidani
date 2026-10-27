import 'package:go_router/go_router.dart';

import '../UI/animals/widgets/animals_screen.dart';
import '../UI/animal/widgets/animal_screen.dart';
import '../UI/core/error_screen.dart';
import '../UI/apply/widgets/apply_screen.dart';

final router = GoRouter(
  initialLocation: '/animals',
  errorBuilder: (context, state) => ErrorScreen(address: state.uri.toString()),
  routes: [
    GoRoute(
      path: '/animals',
      builder: (context, state) => AnimalsScreen(
        species: state.uri.queryParameters['species'],
        need: state.uri.queryParameters['need'],
      ),
      routes: [
        GoRoute(
          path: ':animalId',
          builder: (context, state) =>
              AnimalScreen(animalId: state.pathParameters['animalId']!),
          routes: [
            GoRoute(
              path: 'apply',
              builder: (context, state) =>
                  ApplyScreen(animalId: state.pathParameters['animalId']!),
            ),
          ],
        ),
      ],
    ),
  ],
);
