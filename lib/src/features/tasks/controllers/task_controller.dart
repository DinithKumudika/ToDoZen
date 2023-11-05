import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_zen/src/features/tasks/models/task_model.dart';
import 'package:to_do_zen/src/repositories/task_repository.dart';

class TaskController extends GetxController {
  static TaskController get instance => Get.find();

  Future<String?> add(TaskModel task) async {
    try {
      String? taskId = await TaskRepository.instance.add(task);
      return taskId;
    } catch (e) {}
    return null;
  }
}
