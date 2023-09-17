import 'package:flutter/material.dart';
import 'package:to_do_zen/src/constants/colors.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(40.0),),
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.06,
        vertical: size.height * 0.03,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Add Task',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: COLOR_PRIMARY,
              fontSize: 25.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
