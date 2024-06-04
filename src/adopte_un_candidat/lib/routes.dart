import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'home.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: 'home',
      builder: (BuildContext context, GoRouterState state) {
        return const Home();
      },
    ),
    GoRoute(
      path: '/discussion',
      name: 'discussion',
      builder: (BuildContext context, GoRouterState state) {
        return const Home(); // TODO: Replace with the discussion page
      },
    ),
    GoRoute(
      path: '/profile',
      name: 'profile',
      builder: (BuildContext context, GoRouterState state) {
        return const Home(); // TODO: Replace with the profile page
      },
    ),
    GoRoute(
      path: '/settings',
      name: 'settings',
      builder: (BuildContext context, GoRouterState state) {
        return const Home(); // TODO: Replace with the settings page
      },
    ),
    GoRoute(
      path: '/chat',
      name: 'chat',
      builder: (BuildContext context, GoRouterState state) {
        return const Home(); // TODO: Replace with the chat page
      },
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (BuildContext context, GoRouterState state) {
        return const Home(); // TODO: Replace with the login page
      },
    ),
    GoRoute(
      path: '/register',
      name: 'register',
      builder: (BuildContext context, GoRouterState state) {
        return const Home(); // TODO: Replace with the register page
      },
    )
  ],
);