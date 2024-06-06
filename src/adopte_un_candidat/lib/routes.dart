import 'package:adopte_un_candidat/modules/authentication.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'home.dart';
import 'register.dart';
import 'login.dart';
import 'profile.dart';
import 'messages.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: 'home',
      builder: (BuildContext context, GoRouterState state) {
        return FutureBuilder<bool>(
          future: Authentication().isUserAuthenticated(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();  // Show a loading spinner while waiting
            } else if (snapshot.data == true) {
              return const Home();
            } else {
              return const Login();
            }
          }
        );
      },
    ),
    GoRoute(
      path: '/messages',
      name: 'messages',
      builder: (BuildContext context, GoRouterState state) {
        return const Messages();
      },
    ),
    GoRoute(
      path: '/profile',
      name: 'profile',
      builder: (BuildContext context, GoRouterState state) {
        return const Profile();
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
        return const Register(); // TODO: Replace with the register page
      },
    )
  ],
);