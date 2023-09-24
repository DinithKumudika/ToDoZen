import 'package:flutter/material.dart';
import 'package:to_do_zen/src/features/tasks/screens/widgets/task_list.dart';
import 'package:to_do_zen/src/features/tasks/screens/widgets/task_search.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0,),
          child: TaskSearch(),
        ),
        TaskList(),
      ],
    );
  }
}