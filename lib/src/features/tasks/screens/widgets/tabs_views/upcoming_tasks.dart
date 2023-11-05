import 'package:flutter/material.dart';
import 'package:to_do_zen/src/features/tasks/models/task_model.dart';
import 'package:to_do_zen/src/features/tasks/screens/widgets/task_card.dart';

class UpcomingTasks extends StatelessWidget {
  final List<TaskModel> tasks; // Pass the list of tasks as a parameter

  const UpcomingTasks({Key? key, required this.tasks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(tasks);
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            for (var task in tasks)
              TaskCard(
                taskName: task.title, // Use task data from the list
                priorityLevel: task.priority == 1
                    ? "high"
                    : "low", // Use task data from the list
              ),
          ],
        ),
      ),
    );
  }
}
