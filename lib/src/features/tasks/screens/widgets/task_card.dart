import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:to_do_zen/src/constants/colors.dart';
import 'package:to_do_zen/src/features/tasks/models/task_model.dart';
import 'package:intl/intl.dart';

class TaskCard extends StatelessWidget {
  final String taskName;
  final String priorityLevel;
  final TaskModel task;

  const TaskCard(
      {super.key,
      required this.taskName,
      required this.priorityLevel,
      required this.task});

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

  // Method to format the date
  String formatDate() {
    Timestamp timestamp = task.endDate;
    DateTime dateTime = timestamp.toDate();
    return DateFormat('dd/MM/yy').format(dateTime);
  }

  String formatstartDate() {
    Timestamp timestamp = task.startDate;
    DateTime dateTime = timestamp.toDate();
    return DateFormat('dd/MM/yy').format(dateTime);
  }

  void openTaskDetailsOverlay(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              
             borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.amber, // Set the border color
                width: 2.0, // Set the border width
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    taskName,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
        
                Text(task.description),
                Text('Priority Level: $priorityLevel'),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Start Date: ${formatstartDate()}'),
                    SizedBox(width: 50),
                    Text('End Date: ${formatDate()}'),
                  ],
                ),
        
                Container(
                    padding: EdgeInsets.all(3),
                    color: Colors.amber[600],
                    child: Text(task.label)),
                SizedBox(width: 50)
                // Add more task details as needed
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          openTaskDetailsOverlay(
              context); // Call the method to open the overlay
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
              IconButton(
                onPressed: () {
                  openTaskDetailsOverlay(
                      context); // Call the method to open the overlay
                },
                icon: Icon(Icons.arrow_forward_rounded),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
