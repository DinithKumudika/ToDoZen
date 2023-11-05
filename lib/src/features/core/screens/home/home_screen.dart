import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:to_do_zen/src/constants/colors.dart';
import 'package:to_do_zen/src/features/core/controllers/home_controller.dart';
import 'package:to_do_zen/src/features/tasks/screens/add_task_overlay.dart';
import 'package:to_do_zen/src/features/tasks/screens/tasks_screen.dart';
import 'package:to_do_zen/src/features/core/screens/home/widgets/home_intro.dart';
import 'package:to_do_zen/src/widgets/bottom_navigation.dart';
import 'package:to_do_zen/src/widgets/drawer/drawer_menu.dart';
import 'package:to_do_zen/src/widgets/tdz_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final _homeController = Get.put(HomeController());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const TDZAppBar(),
      body: Obx(
        () => SafeArea(
          child: _homeController.isLoading.value
              ? const SpinKitThreeBounce(
                  color: COLOR_PRIMARY,
                  size: 40.0,
                )
              : _homeController.hasTasks.value
                  ? const TasksScreen()
                  : const HomeIntro(),
        ),
      ),
      drawer: Obx(
        () => DrawerMenu(
          fullName: _homeController.fullName.value,
          email: _homeController.email.value,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          enableDrag: false,
          context: context,
          builder: (context) {
            return const AddTaskOverlay();
          },
        ),
        backgroundColor: COLOR_PRIMARY,
        elevation: 0,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
