import 'package:flutter/material.dart';
import 'package:to_do_zen/src/constants/colors.dart';
import 'package:to_do_zen/src/constants/strings.dart';
import 'package:to_do_zen/src/features/tasks/widgets/multi_select_chip.dart';
import 'package:to_do_zen/src/screens/task_list.dart';

class AddTaskOverlay extends StatefulWidget {
  const AddTaskOverlay({super.key});

  @override
  State<AddTaskOverlay> createState() => _AddTaskOverlayState();
}

class _AddTaskOverlayState extends State<AddTaskOverlay> {
  int selectedIndex = -1; // Initialize with -1 to represent no selected chip
  Color _uploadIconColor = COLOR_LIGHTGRAY;
  // GET Attachment Image
  // void getImage() async {
  //   final pickedFile =
  //       await ImagePicker().pickImage(source: ImageSource.gallery);
  //   setState(() {
  //     if (pickedFile != null) {
  //       print('Image selected.');

  //       setState(() {
  //         _postCaption = "";
  //         _uploadIconColor = AppColors.accentColor;
  //       });
  //     } else {
  //       print('No image selected.');
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
        padding:
            EdgeInsets.fromLTRB(width * 0.05, height * 0.05, width * 0.05, 0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Add Your Task',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: COLOR_DARK),
              ),
              const SizedBox(height: 15),
              const TextField(
                style: TextStyle(
                  fontSize: 15,
                ),
                decoration: InputDecoration(
                  hintText: 'Task Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              const TextField(
                style: TextStyle(
                  fontSize: 15,
                ),
                decoration: InputDecoration(
                  hintText: 'Task Description',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  const Text(
                    'Priority:',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(width: 5),
                  MultiSelectChip(
                    index: 1,
                    selectedIndex: selectedIndex,
                    priorityLevel: 'Low',
                    selectedColor: COLOR_SUCCESS,
                    onChipSelected: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  ),
                  MultiSelectChip(
                    index: 2,
                    selectedIndex: selectedIndex,
                    priorityLevel: 'Medium',
                    selectedColor: COLOR_ALERT,
                    onChipSelected: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  ),
                  MultiSelectChip(
                    index: 3,
                    selectedIndex: selectedIndex,
                    priorityLevel: 'High',
                    selectedColor: COLOR_DANGER,
                    onChipSelected: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: height * 0.03),
              Container(
                padding: EdgeInsets.only(top: height * 0.03),
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: COLOR_GRAY,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.image_outlined,
                        size: 25,
                        color: COLOR_GRAY,
                      ),
                    ),
                    const SizedBox(width: 5),
                    const IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.flag_rounded,
                        size: 25,
                        color: COLOR_PRIMARY,
                      ),
                    ),
                    const SizedBox(width: 5),
                    const IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.watch_later_outlined,
                        size: 25,
                        color: COLOR_PRIMARY,
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(COLOR_PRIMARY),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  5.0), // Adjust the border radius as needed
                            ),
                          ),
                        ),
                        onPressed: () {
                          //navigate to task list screen

                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const TaskList()));
                        },
                        child: const Text(
                          'Save Task',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ))
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
