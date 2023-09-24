import 'package:get/get.dart';
import 'package:to_do_zen/src/features/tasks/models/task_model.dart';
import 'package:to_do_zen/src/repositories/task_repository.dart';

class TaskListController extends GetxController {
  final taskRepository = Get.put(TaskRepository());

  Future<List<TaskModel>?> getTasksByUser(String uid) async {
    final List<TaskModel>? tasks = await taskRepository.getTasksByUser(uid);
    return tasks;
  }

  Future<int?> getTasksCountByUser(String uid) async {
    final int? taskCount = await taskRepository.getTaskCountByUser(uid);
    return taskCount;
  }
}
