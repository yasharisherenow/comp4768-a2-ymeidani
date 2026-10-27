import 'package:go_router/go_router.dart';
import '../ui/animals/widgets/animals_screen.dart';
final router = GoRouter(
initialLocation: '/animals',
  routes: [
    GoRoute(
      path: '/animals',
      builder: (context, state) => const AnimalsScreen(),
    ),
  ],
);  