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
  ],
);