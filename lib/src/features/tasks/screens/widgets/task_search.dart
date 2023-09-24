import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_zen/src/constants/colors.dart';
import 'package:to_do_zen/src/features/tasks/controllers/task_search_controller.dart';
import 'package:to_do_zen/src/features/tasks/screens/widgets/filter_tasks.dart';
import 'package:to_do_zen/src/widgets/tdz_form_field.dart';

class TaskSearch extends StatelessWidget {
  const TaskSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final _searchFormKey = GlobalKey<FormState>();
    final TaskSearchController taskSearchController =
        Get.put(TaskSearchController());

    return Form(
      key: _searchFormKey,
      child: Container(
        child: Obx(
          () => TDZFormField(
            controller: taskSearchController.searchQuery,
            isTextObscure: false,
            isFocused: taskSearchController.isSearchFocused.value,
            hintText: 'Search your task...',
            prefixIcon: Icons.search,
            hasSuffix: true,
            suffixIcon: Icons.filter_list_rounded,
            suffixColor: COLOR_PRIMARY,
            onTap: () {
              taskSearchController.isSearchFocused.value = true;
            },
            onIconClicked: () {
              showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                enableDrag: false,
                context: context,
                builder: (context) {
                  return FilterTasks();
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
