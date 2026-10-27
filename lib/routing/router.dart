import 'package:go_router/go_router.dart';
import '../UI/animals/widgets/animals_screen.dart';
final router = GoRouter(
initialLocation: '/animals',
  routes: [
    GoRoute(
      path: '/animals',
      builder: (context, state) => AnimalsScreen(
        species: state.uri.queryParameters['species'],
        need: state.uri.queryParameters['need'],
      ),
    ),
  ],
);  
