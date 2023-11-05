import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do_zen/src/features/authentication/models/user_model.dart';
import 'package:to_do_zen/src/features/tasks/models/task_model.dart';
import 'package:to_do_zen/src/features/tasks/screens/widgets/task_card.dart';
import 'package:to_do_zen/src/repositories/task_repository.dart';

class TestTaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    String? userId = user?.uid; // User's UID, if logged in
    print(userId);

    return FutureBuilder<List<TaskModel>?>(
      future: TaskRepository.instance.getTasksByUser(userId ?? ''),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text('No tasks found.');
        } else {
          List<TaskModel> tasks = snapshot.data!;
          print(tasks);

          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              if (tasks[index].status == 'Completed') {
                // Task is completed, don't display it
                return SizedBox.shrink();
              }

              return TaskCard(
                taskName: tasks[index].title, // Use task data from the list
                priorityLevel: tasks[index].priority, task: tasks[index],
              );
            },
          );
        }
      },
    );
  }
}
