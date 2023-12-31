// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:to_do_zen/src/constants/colors.dart';
// import 'package:to_do_zen/src/features/authentication/models/user_model.dart';
// import 'package:to_do_zen/src/features/core/controllers/profile_controller.dart';
// import 'package:to_do_zen/src/features/core/screens/home/widgets/home_intro.dart';
// import 'package:to_do_zen/src/features/tasks/screens/add_task_overlay.dart';
// import 'package:to_do_zen/src/features/tasks/widgets/task_card.dart';

// import 'package:to_do_zen/src/widgets/bottom_navigation.dart';
// import 'package:to_do_zen/src/widgets/tdz_app_bar.dart';

// class TaskList extends StatefulWidget {
//   const TaskList({super.key});

//   @override
//   State<TaskList> createState() => _TaskListState();
// }

// class _TaskListState extends State<TaskList> {
//   String _fullName = "";
//   String _email = "";

//   @override
//   void initState() {
//     super.initState();
//     initUser();
//   }

//   initUser() async {
//     UserModel? data = await Get.put(ProfileController()).currentUserData();
//     setState(() {
//       _fullName = "${data!.firstName} ${data.lastName}";
//       _email = data.email;
//     });
//     print(_fullName);
//     print(_email);
//   }

//   // Opening AddTaskOverlay
//   void openAddTaskOverlay() {
//     showModalBottomSheet(
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(
//           top: Radius.circular(20),
//         ),
//       ),
//       enableDrag: false,
//       isScrollControlled: true,
//       context: context,
//       builder: (ctx) => const AddTaskOverlay(),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return SafeArea(
//         child: Scaffold(
//       appBar: const TDZAppBar(),
//       body: ListView.builder(
//         itemCount: 3,
//         itemBuilder: (context, index) {
//           return TaskCard();
//         },
//       ),
//       drawer: DrawerMenu(
//         fullName: _fullName,
//         email: _email,
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: openAddTaskOverlay,
//         backgroundColor: COLOR_PRIMARY,
//         elevation: 0,
//         child: const Icon(Icons.add),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: const BottomNavigation(),
//     ));
//   }
// }
