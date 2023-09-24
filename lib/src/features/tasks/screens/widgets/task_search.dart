import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_zen/src/features/tasks/controllers/task_search_controller.dart';
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
        padding: const EdgeInsets.only(top: 20.0),
        child: Obx(
          () => TDZFormField(
            controller: taskSearchController.searchQuery,
            isTextObscure: false,
            isFocused: taskSearchController.isSearchFocused.value,
            hintText: 'Search your task...',
            prefixIcon: Icons.search,
            onTap: () {
              taskSearchController.isSearchFocused.value = true;
            },
          ),
        ),
      ),
    );
  }
}
