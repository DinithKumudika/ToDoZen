import 'package:flutter/material.dart';
import 'package:to_do_zen/src/constants/colors.dart';
import 'package:to_do_zen/src/constants/images.dart';
import 'package:to_do_zen/src/repositories/auth_repository.dart';
import 'package:to_do_zen/src/widgets/drawer/drawer_menu_body.dart';

class DrawerMenu extends StatelessWidget {
  final String email;
  final String fullName;

  const DrawerMenu({
    required this.email,
    required this.fullName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 50.0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: COLOR_PRIMARY,
              image: DecorationImage(
                image: AssetImage(drawerAccountBg),
                fit: BoxFit.cover,
              ),
            ),
            accountName: Text(
              fullName,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            accountEmail: Text(
              email,
              style: const TextStyle(fontSize: 15.0),
            ),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: COLOR_LIGHT,
              foregroundImage: AssetImage(defaultAvatar),
            ),
          ),
          const DrawerMenuBody(),
        ],
      ),
    );
  }
}
