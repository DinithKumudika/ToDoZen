import 'package:flutter/material.dart';
import 'package:to_do_zen/src/constants/colors.dart';
import 'package:to_do_zen/src/constants/strings.dart';

class AddTaskOverlay extends StatefulWidget {
  const AddTaskOverlay({super.key});

  @override
  State<AddTaskOverlay> createState() => _AddTaskOverlayState();
}

class _AddTaskOverlayState extends State<AddTaskOverlay> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(10, 25, 10, 0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Add Your Task'),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your task',
                  border: OutlineInputBorder(),
                ),
              ),
                SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Task Description',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text('Priority:'),
                  SizedBox(width: 5),
          
                ],
              )
            ],
          ),
        ));
  }
}
