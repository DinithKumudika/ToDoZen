import 'package:flutter/material.dart';
import 'package:to_do_zen/src/constants/colors.dart';

class FilterTasks extends StatelessWidget {
  FilterTasks({super.key});

  String priorityValue = 'Low';
  String labelValue = 'Personal';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.0),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.06,
        vertical: size.height * 0.03,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Filter Task',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: COLOR_PRIMARY,
              fontSize: 25.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 15.0,
            ),
            child: Row(
              children: [
                Text(
                  'Priority',
                  style: TextStyle(
                    color: COLOR_DARK_ALT,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: size.width * 0.1,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: COLOR_PRIMARY),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButton(
                    value: priorityValue,
                    underline: SizedBox(),
                    icon: const Icon(Icons.arrow_drop_down),
                    onChanged: (String? newValue) {
                      
                    },
                    items: [
                      DropdownMenuItem(
                        child: Row(
                          children: [
                            Container(
                              width: 15.0,
                              height: 15.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green,
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.05,
                            ),
                            Text('Low'),
                          ],
                        ),
                        value: 'Low',
                      ),
                      DropdownMenuItem(
                        child: Row(
                          children: [
                            Container(
                              width: 15.0,
                              height: 15.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.yellow,
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.05,
                            ),
                            Text('Medium'),
                          ],
                        ),
                        value: 'Medium',
                      ),
                      DropdownMenuItem(
                        child: Row(
                          children: [
                            Container(
                              width: 15.0,
                              height: 15.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red,
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.05,
                            ),
                            Text('High'),
                          ],
                        ),
                        value: 'High',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 15.0,
            ),
            child: Row(
              children: [
                Text(
                  'Label',
                  style: TextStyle(
                    color: COLOR_DARK_ALT,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: size.width * 0.15,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: COLOR_PRIMARY),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButton(
                    value: labelValue,
                    underline: SizedBox(),
                    icon: const Icon(Icons.arrow_drop_down),
                    onChanged: (String? newValue) {},
                    items: [
                      DropdownMenuItem(
                        child: Text('Personal'),
                        value: 'Personal',
                      ),
                      DropdownMenuItem(
                        child: Text('Work'),
                        value: 'Work',
                      ),
                      DropdownMenuItem(
                        child: Text('Social'),
                        value: 'Social',
                      ),
                      DropdownMenuItem(
                        child: Text('School'),
                        value: 'School',
                      ),
                      DropdownMenuItem(
                        child: Text('Family'),
                        value: 'Family',
                      ),
                      DropdownMenuItem(
                        child: Text('Projects'),
                        value: 'Projects',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.1,
          ),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: COLOR_PRIMARY,
                fixedSize: Size(
                  size.width * 0.3,
                  size.height * 0.05,
                ),
              ),
              onPressed: () {},
              child: Text(
                'Filter',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
