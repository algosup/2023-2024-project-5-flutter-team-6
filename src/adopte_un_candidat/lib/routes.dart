import 'package:adopte_un_candidat/modules/authentication.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'home.dart';
import 'register.dart';
import 'login.dart';
import 'profile.dart';
import 'messages.dart';
import 'chat.dart';
import 'softskills.dart';
import 'favorites.dart';

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
              return const CircularProgressIndicator();
            } else if (snapshot.data == true) {
              return Home();
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
        return FutureBuilder<bool>(
          future: Authentication().isUserAuthenticated(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.data == true) {
              return const Messages();
            } else {
              return const Login();
            }
          }
        );
      },
    ),
    GoRoute(
      path: '/profile',
      name: 'profile',
      builder: (BuildContext context, GoRouterState state) {
        return FutureBuilder<bool>(
          future: Authentication().isUserAuthenticated(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.data == true) {
              return const Profile();
            } else {
              return const Login();
            }
          }
        );
      },
    ),
    GoRoute(
      path: '/softskills',
      name: 'softskills',
      builder: (BuildContext context, GoRouterState state) {
        return const Softskills();
      },
    ),
    GoRoute(
      path: '/chat',
      name: 'chat',
      builder: (BuildContext context, GoRouterState state) {
        final Map<String, dynamic> args = state.extra as Map<String, dynamic>;
        final String conversationId = args["convId"];
        return FutureBuilder<bool>(
          future: Authentication().isUserAuthenticated(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.data == true) {
              return Chat(conversationId: conversationId);
            } else {
              return const Login();
            }
        });
      },
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (BuildContext context, GoRouterState state) {
        return const Login();
      },
    ),
    GoRoute(
      path: '/register',
      name: 'register',
      builder: (BuildContext context, GoRouterState state) {
        return const Register();
      },
    ),
    GoRoute(
      path: '/favorites',
      name: 'favorites',
      builder: (BuildContext context, GoRouterState state) {
        return const Favorites();
      },
    ),
  ],
);