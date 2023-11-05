import 'package:flutter/material.dart';
import 'package:to_do_zen/src/constants/colors.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: COLOR_LIGHT,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: COLOR_LIGHTGRAY,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: 10,
              decoration: const BoxDecoration(
                  color: COLOR_SUCCESS, //priorityColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  )),
            ),
            const Expanded(
              child: ListTile(
                leading: Icon(Icons.check_box, color: COLOR_PRIMARY),
                title: Text('Study for exam'),
                subtitle: Text('exams starting from Monday'),
                trailing: Icon(
                  Icons.flag_rounded,
                  color: COLOR_PRIMARY,
                ),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
