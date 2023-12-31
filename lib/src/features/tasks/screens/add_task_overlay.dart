import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_zen/src/constants/colors.dart';
import 'package:intl/intl.dart'; // Import the intl package
import 'package:to_do_zen/src/widgets/bottom_navigation.dart';
import 'package:to_do_zen/src/constants/strings.dart';
import 'package:to_do_zen/src/features/tasks/controllers/task_controller.dart';
import 'package:to_do_zen/src/features/tasks/models/task_model.dart';
import 'package:to_do_zen/src/features/tasks/widgets/label_sheet.dart';
import 'package:to_do_zen/src/features/tasks/widgets/multi_select_chip.dart';
import 'package:to_do_zen/src/features/tasks/widgets/attachment_sheet.dart';
import 'package:to_do_zen/src/features/tasks/widgets/calendar_sheet.dart';
import 'package:to_do_zen/src/repositories/auth_repository.dart';
import 'package:to_do_zen/src/widgets/drawer/drawer_menu.dart';
import 'package:to_do_zen/src/widgets/tdz_app_bar.dart';
import 'package:to_do_zen/src/features/core/controllers/home_controller.dart';

class AddTaskOverlay extends StatefulWidget {
  const AddTaskOverlay({super.key});

  @override
  State<AddTaskOverlay> createState() => _AddTaskOverlayState();
}

class _AddTaskOverlayState extends State<AddTaskOverlay> {
  int selectedPriority = -1; // Initialize with -1 to represent no selected chip
  bool isImageSelected = false;
  File? selectedImage;
  String startDate = "-";
  String endDate = "-";
  String priorityName = "";
  String? selectedLabel;
  final taskNameController = TextEditingController();
  final taskDescriptionController = TextEditingController();

  final taskController = Get.put(TaskController());

  // Handling Image Selection
  void handleImageSelected(bool value) {
    setState(() {
      isImageSelected = value; // Update the state in the parent widget
    });
  }

  // Handling Selected Image File
  void handleImageFile(File value) {
    setState(() {
      selectedImage = value; // Update the state in the parent widget
    });
  }

  // Attachment Sheet
  void openAttachementSheet() {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      enableDrag: false,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => AttachmentSheet(
        onImageSelected: handleImageSelected,
        onImageFile: handleImageFile,
      ),
    );
  }

  void _showDateRangePicker() async {
    final val = await showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        enableDrag: false,
        isScrollControlled: true,
        context: context,
        builder: (BuildContext builderContext) {
          return const CalendarSheet();
        });
    // Handle the returned val from the ChildWidget
    if (val != null) {
      setState(() {
        startDate = DateFormat('yyyy-MM-dd').format(val.startDate);
        endDate = DateFormat('yyyy-MM-dd').format(val.endDate);
      });

      print(startDate);
      print(endDate);
    }
  }

  // Label Sheet
  void openLabelSheet() {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      enableDrag: false,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => LabelSheet(
        onLabelSelected: (selectedLabelName) {
          print(selectedLabelName);
          setState(() {
            selectedLabel = selectedLabelName;
          });
        },
      ),
    );
  }

  // Save Task Submit
  void saveTask() async {
    final taskName = taskNameController.text;
    final taskDescription = taskDescriptionController.text;
    // Check for text values
    if (taskName.isEmpty || taskDescription.isEmpty) {
      print('Task name and description are required.');
      const snackBar = SnackBar(
        content: Text('Task name and description are required.'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (selectedPriority == -1) {
      print('Priority is required.');

      const snackBar = SnackBar(
        content: Text('Please select a priority level.'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (selectedLabel == null) {
      print('Label is required.');

      const snackBar = SnackBar(
        content: Text('Please select a label.'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      print('Save');

      // Save Task LOGIC
      TaskModel newTask = TaskModel(
        uid: AuthRepository.instance.currentUserId()!,
        title: taskName,
        priority: priorityName,
        description: taskDescription,
        label: selectedLabel!,
        status: 'Pending',
        startDate: Timestamp.fromDate(DateTime.parse(startDate)),
        endDate: Timestamp.fromDate(DateTime.parse(endDate)),
      );
      String? taskId = await taskController.add(newTask);
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final _homeController = Get.put(HomeController());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: const BottomNavigation(),
      drawer: Obx(
        () => DrawerMenu(
          fullName: _homeController.fullName.value,
          email: _homeController.email.value,
        ),
      ),
      
      body: Padding(
        padding:
            EdgeInsets.fromLTRB(width * 0.05, height * 0.08, width * 0.05, 0),
        child: SizedBox(
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
              TextField(
                controller: taskNameController,
                style: const TextStyle(
                  fontSize: 15,
                ),
                decoration: const InputDecoration(
                  hintText: 'Task Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: taskDescriptionController,
                style: const TextStyle(
                  fontSize: 15,
                ),
                decoration: const InputDecoration(
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
                    selectedIndex: selectedPriority,
                    priorityLevel: 'Low',
                    selectedColor: COLOR_SUCCESS,
                    onChipSelected: (index) {
                      setState(() {
                        selectedPriority = index;
                        priorityName = 'Low';
                      });
                    },
                  ),
                  MultiSelectChip(
                    index: 2,
                    selectedIndex: selectedPriority,
                    priorityLevel: 'Medium',
                    selectedColor: COLOR_ALERT,
                    onChipSelected: (index) {
                      setState(() {
                        selectedPriority = index;
                        priorityName = 'Medium';
                      });
                    },
                  ),
                  MultiSelectChip(
                    index: 3,
                    selectedIndex: selectedPriority,
                    priorityLevel: 'High',
                    selectedColor: COLOR_DANGER,
                    onChipSelected: (index) {
                      setState(() {
                        selectedPriority = index;
                        priorityName = 'High';
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: height * 0.02),
              selectedImage != null
                  ? SizedBox(
                      width: width * 0.4,
                      height: height * 0.3,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            10.0), // Adjust the value as needed
                        child: Image.file(
                          selectedImage!,
                          width: 50,
                          height: 50,
                          fit: BoxFit
                              .cover, // You can adjust the BoxFit as needed
                        ),
                      ))
                  : const Text(
                      'No Attachment Selected',
                      style: TextStyle(color: COLOR_GRAY),
                    ),
              SizedBox(height: height * 0.03),
              Row(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Start Date",
                        style: TextStyle(fontSize: 14, color: COLOR_PRIMARY),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        startDate,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Due Date',
                        style: TextStyle(fontSize: 14, color: COLOR_PRIMARY),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        endDate,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  const Text(
                    'Label:',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    selectedLabel ?? 'No Label Selected',
                    style: const TextStyle(
                      fontSize: 15,
                      color: COLOR_PRIMARY,
                    ),
                  ),
                ],
              ),
              const Expanded(child: SizedBox()),
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
                    IconButton(
                      onPressed: openAttachementSheet,
                      icon: Icon(
                        isImageSelected
                            ? Icons.image_rounded
                            : Icons.image_outlined,
                        size: 25,
                        color: isImageSelected ? COLOR_PRIMARY : COLOR_GRAY,
                      ),
                    ),
                    const SizedBox(width: 5),
                    IconButton(
                      onPressed: openLabelSheet,
                      icon: const Icon(
                        Icons.flag_rounded,
                        size: 25,
                        color: COLOR_GRAY,
                      ),
                    ),
                    const SizedBox(width: 5),
                    IconButton(
                      onPressed: _showDateRangePicker,
                      icon: const Icon(
                        Icons.watch_later_outlined,
                        size: 25,
                        color: COLOR_GRAY,
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
                        onPressed: saveTask,
                        child: const Text(
                          'Save Task',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(height: height * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
