import 'package:flutter/material.dart';
import 'package:to_do_zen/src/features/tasks/screens/widgets/task_card.dart';

class UpcomingTasks extends StatelessWidget {
  const UpcomingTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            TaskCard(
              taskName: 'Task 1',
              priorityLevel: 'High',
            ),
            TaskCard(
              taskName: 'Task 2',
              priorityLevel: 'Low',
            ),
            TaskCard(
              taskName: 'Task 2',
              priorityLevel: 'Medium',
            ),
          ],
        ),
      ),
    );
  }
}
