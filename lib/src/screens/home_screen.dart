import 'package:flutter/material.dart';
import 'package:to_do_zen/src/screens/task/add_task_overlay.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void openAddTaskOverlay(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => const AddTaskOverlay(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Task Home'),
      ),
      body: Center(
        child: TextButton(
            onPressed: () {
              // Open the Add Task overlay
              openAddTaskOverlay(context);
            },
            child: const Text('Add Task')),
      ),
    );
  }
}
