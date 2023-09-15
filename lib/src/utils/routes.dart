import 'package:flutter/material.dart';
import 'package:to_do_zen/src/features/authentication/screens/login/login_screen.dart';
import 'package:to_do_zen/src/features/tasks/screens/home_screen.dart';
import 'package:to_do_zen/src/screens/on_boarding/on_boarding_screen.dart';
import 'package:to_do_zen/src/screens/splash_screen.dart';
import 'package:to_do_zen/src/screens/welcome_screen.dart';

// Define your routes as a Map<String, WidgetBuilder> where the keys are the route names
// and the values are functions that return the widget for that route.

final Map<String, WidgetBuilder> routes = {
  '/home': (context) => const HomeScreen(),
  '/': (context) => const SplashScreen(),
  '/on_boarding': (context) => const OnBoardingScreen(),
  '/welcome': (context) => const WelcomeScreen(),
  '/login': (context) => const LoginScreen()
};
