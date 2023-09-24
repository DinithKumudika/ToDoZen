import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_zen/src/features/tasks/models/task_model.dart';
import 'package:to_do_zen/src/repositories/task_repository.dart';

class TaskSearchController extends GetxController {
  final taskRepository = Get.put(TaskRepository());

  final searchQuery = TextEditingController();

  final RxBool isSearchFocused = false.obs;
  
}
