import 'package:flutter/material.dart';
import 'package:to_do_zen/src/features/authentication/screens/login/login_screen.dart';
import 'package:to_do_zen/src/features/authentication/screens/register/register_screen.dart';
import 'package:to_do_zen/src/features/core/screens/home/home_screen.dart';
import 'package:to_do_zen/src/features/tasks/screens/add_task_overlay.dart';
import 'package:to_do_zen/src/screens/on_boarding/on_boarding_screen.dart';
import 'package:to_do_zen/src/screens/splash_screen.dart';
import 'package:to_do_zen/src/screens/welcome_screen.dart';
import 'package:to_do_zen/src/features/core/screens/profile/profile_screen.dart';

// Define your routes as a Map<String, WidgetBuilder> where the keys are the route names
// and the values are functions that return the widget for that route.

final Map<String, WidgetBuilder> routes = {
  '/home': (context) => const HomeScreen(),
  '/': (context) => const SplashScreen(),
  '/on_boarding': (context) => const OnBoardingScreen(),
  '/welcome': (context) => const WelcomeScreen(),
  '/login': (context) => LoginScreen(),
  '/register': (context) => const RegisterScreen(),
  '/add_task': (context) => const AddTaskOverlay(),
  '/user_profile': (context) => ProfileScreen(),
};
