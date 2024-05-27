

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:space_explorer/planet_model.dart';
import 'package:space_explorer/single_planet_screen.dart';

import 'planets_screen.dart';

class Routes {
  final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const PlanetsScreen(),
      ),
      GoRoute(
        path: "/singlePlanet/:index",
        pageBuilder: (context, state) {
          final index = int.parse(state.pathParameters['index']!);
          final planet = planetList[index];
          return CustomTransitionPage(
            child: SinglePlanetScreen(planet: planet, index: index),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        },
      ),

    ],
  );
}