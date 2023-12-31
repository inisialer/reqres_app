import 'package:go_router/go_router.dart';
import 'package:regres_app/helper/router_name.dart';
import 'package:regres_app/ui/home_screen.dart';
import 'package:regres_app/ui/login_screen.dart';
import 'package:regres_app/ui/register_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/login',
  routes: <RouteBase>[
    GoRoute(
      path: '/login',
      name: login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      name: register,
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/home',
      name: home,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
