import 'package:flutter/material.dart';
import 'package:to_do_zen/src/constants/colors.dart';
import 'package:to_do_zen/src/widgets/bottom_navigation.dart';
import 'package:to_do_zen/src/widgets/drawer/drawer_menu.dart';
import 'package:to_do_zen/src/widgets/tdz_app_bar.dart';
import 'package:get/get.dart';
import 'package:to_do_zen/src/features/core/controllers/home_controller.dart';

class ProfileScreen extends StatelessWidget {
  final _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const TDZAppBar(),
      bottomNavigationBar: const BottomNavigation(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/add_task'),
        backgroundColor: COLOR_PRIMARY,
        elevation: 0,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: Obx(
        () => DrawerMenu(
          fullName: _homeController.fullName.value,
          email: _homeController.email.value,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'User Profile',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: COLOR_DARK),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                width: 70,
                height: 70,
                child: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/avatar_default.png'),
                  radius: 35,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: null,
                child: Container(
                  height: 48,
                  width: MediaQuery.of(context!).size.width * 0.3,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: COLOR_PRIMARY, // Border color
                      width: 1.0, // Border width
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.upload,
                        color: COLOR_PRIMARY,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Change",
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          color: COLOR_PRIMARY,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
                controller:
                    TextEditingController(text: _homeController.fullName.value),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                controller:
                    TextEditingController(text: _homeController.email.value),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                ),
                controller:
                    TextEditingController(text: _homeController.phoneNo.value),
              ),
              Expanded(child: SizedBox()),
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(COLOR_PRIMARY),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          5.0), // Adjust the border radius as needed
                    ),
                  ),
                ),
                onPressed: null,
                child: const Text(
                  'Update Profile',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
