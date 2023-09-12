import 'package:flutter/material.dart';
import 'package:to_do_zen/src/constants/colors.dart';
import 'package:to_do_zen/src/repositories/auth_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text(
              "home screen",
              style: TextStyle(
                color: COLOR_DARK,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                AuthRepository.instance.logoutUser();
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
