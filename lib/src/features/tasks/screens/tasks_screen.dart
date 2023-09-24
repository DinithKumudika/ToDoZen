import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_zen/src/constants/colors.dart';
import 'package:to_do_zen/src/features/tasks/controllers/task_list_controller.dart';
import 'package:to_do_zen/src/features/tasks/screens/widgets/tabs_views/completed_tasks.dart';
import 'package:to_do_zen/src/features/tasks/screens/widgets/task_search.dart';
import 'package:to_do_zen/src/features/tasks/screens/widgets/tabs_views/upcoming_tasks.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final taskListController = Get.put(TaskListController());

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
            children: const [
              UpcomingTasks(),
              CompletedTasks(),
            ],
          ),
        ),
        // const TaskList(),
      ],
    );
  }
}
