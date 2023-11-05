import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_zen/src/constants/colors.dart';
import 'package:to_do_zen/src/features/core/controllers/profile_controller.dart';
import 'package:to_do_zen/src/features/tasks/controllers/task_list_controller.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final taskListController = Get.put(TaskListController());
    final profileController = Get.put(ProfileController());
    String? uid = profileController.currentUid();
    taskListController.getTasksByUser(uid!);
    return ListView(
      children: [Text('Task screen ')],
    );
  }
}
