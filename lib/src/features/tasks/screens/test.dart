import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_zen/src/features/tasks/models/task_model.dart';
import 'package:to_do_zen/src/repositories/task_repository.dart';
import 'package:to_do_zen/src/widgets/testtasklist.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TestTaskList(),
    );
  }
}
