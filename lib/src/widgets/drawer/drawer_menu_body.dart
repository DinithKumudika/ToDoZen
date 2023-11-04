import 'package:flutter/material.dart';
import 'package:to_do_zen/src/constants/colors.dart';
import 'package:to_do_zen/src/repositories/auth_repository.dart';
import 'package:to_do_zen/src/widgets/drawer/drawer_menu_item.dart';
import 'package:to_do_zen/src/widgets/drawer/drawer_menu_sub_item.dart';

class DrawerMenuBody extends StatelessWidget {
  const DrawerMenuBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DrawerMenuItem(
          title: 'Tasks',
          icon: Icons.format_list_bulleted_add,
          onTap: () {},
          subTiles: [
            DrawerMenuSubItem(
              title: 'Upcoming',
              icon: Icons.access_alarm_rounded,
              onTap: () {},
            ),
            DrawerMenuSubItem(
              title: 'On Progress',
              icon: Icons.restore_rounded,
              onTap: () {},
            ),
            DrawerMenuSubItem(
              title: 'Completed',
              icon: Icons.alarm_on_rounded,
              onTap: () {},
            ),
          ],
        ),
        const Divider(
          color: COLOR_GRAY,
          indent: 20,
          endIndent: 20,
        ),
        DrawerMenuItem(
          title: 'SignOut',
          icon: Icons.logout_rounded,
          onTap: () => AuthRepository.instance.logoutUser(),
          subTiles: const [],
        ),
      ],
    );
  }
}
