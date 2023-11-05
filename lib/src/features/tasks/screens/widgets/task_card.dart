import 'package:flutter/material.dart';
import 'package:to_do_zen/src/constants/colors.dart';

class TaskCard extends StatelessWidget {
  final String taskName;
  final String priorityLevel;

  const TaskCard(
      {super.key, required this.taskName, required this.priorityLevel});

// Map priority levels to colors
  Color getColorForPriority(String priority) {
    switch (priority) {
      case 'Low':
        return COLOR_SUCCESS;
      case 'Medium':
        return COLOR_ALERT;
      default:
        return COLOR_DANGER; // High
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          print('View Task');
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: COLOR_PRIMARY),
          ),
          child: Row(
            children: [
              const SizedBox(width: 10),
              Text(taskName),
              const Expanded(child: SizedBox()),
              Icon(
                Icons.circle,
                size: 18,
                color: getColorForPriority(priorityLevel),
              ),
              const IconButton(
                onPressed: null, //View Task
                icon: Icon(Icons.arrow_forward_rounded),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
