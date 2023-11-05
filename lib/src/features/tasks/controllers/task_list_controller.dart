import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_zen/src/features/tasks/models/task_model.dart';
import 'package:to_do_zen/src/repositories/task_repository.dart';

class TaskListController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final taskRepository = Get.put(TaskRepository());
  late final TabController tabController;

  final List<Tab> taskTabs = [
    const Tab(
      text: 'Upcoming',
    ),
    const Tab(
      text: 'Completed',
    ),
  ];
  // Define an observable list to store tasks
  final RxList<TaskModel> tasksList = <TaskModel>[].obs;


  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
  }

  Future<List<TaskModel>?> getTasksByUser(String uid) async {
    final List<TaskModel>? tasks = await taskRepository.getTasksByUser(uid);
    return tasks;
  }

  Future<int?> getTasksCountByUser(String uid) async {
    final int? taskCount = await taskRepository.getTaskCountByUser(uid);
    return taskCount;
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
