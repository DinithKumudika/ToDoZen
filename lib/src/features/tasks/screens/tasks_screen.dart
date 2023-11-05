import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_zen/src/constants/colors.dart';
import 'package:to_do_zen/src/features/tasks/controllers/task_list_controller.dart';
import 'package:to_do_zen/src/features/tasks/screens/test.dart';
import 'package:to_do_zen/src/features/tasks/screens/widgets/tabs_views/completed_tasks.dart';
import 'package:to_do_zen/src/features/tasks/screens/widgets/task_search.dart';
import 'package:to_do_zen/src/features/tasks/screens/widgets/tabs_views/upcoming_tasks.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final taskListController = Get.put(TaskListController());

  @override
  void initState() {
    super.initState();
    _fetchTaskList();
  }

  Future<void> _fetchTaskList() async {
    User? user = FirebaseAuth.instance.currentUser;
    String? userId = user?.uid;
    print(userId);

    if (userId != null) {
      final tasks = await taskListController.getTasksByUser(userId);
      print(tasks);
      if (tasks != null) {
        taskListController.tasksList.assignAll(tasks);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(
            top: 20.0,
            left: 15.0,
            right: 15.0,
          ),
          child: TaskSearch(),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        Container(
          height: 50,
          width: size.width * 0.9,
          decoration: BoxDecoration(
            color: COLOR_PRIMARY.withOpacity(0.9),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: TabBar(
              unselectedLabelColor: COLOR_LIGHT,
              labelColor: COLOR_PRIMARY,
              indicator: BoxDecoration(
                color: COLOR_LIGHT,
                borderRadius: BorderRadius.circular(5),
              ),
              indicatorColor: COLOR_LIGHT,
              controller: taskListController.tabController,
              tabs: taskListController.taskTabs,
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: taskListController.tabController,
            children: [
              TaskScreen(),
              CompletedTasks(),
            ],
          ),
        ),
        // const TaskList(),
      ],
    );
  }
}
