import 'package:go_router/go_router.dart';
import 'package:mucs/Views/home_screen/homescreen.dart';

final GoRouter router = GoRouter(
  routes: [GoRoute(path: '/', builder: (context, state) => HomeScreen())],
);
