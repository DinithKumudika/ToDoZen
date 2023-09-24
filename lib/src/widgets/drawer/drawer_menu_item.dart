import 'package:flutter/material.dart';
import 'package:to_do_zen/src/constants/colors.dart';
import 'package:to_do_zen/src/widgets/drawer/drawer_menu_sub_item.dart';

class DrawerMenuItem extends StatelessWidget {
  final List<DrawerMenuSubItem>? subTiles;
  final String title;
  final IconData icon;
  final Function onTap;

  const DrawerMenuItem({
    required this.title,
    required this.icon,
    this.subTiles,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            icon,
            color: COLOR_PRIMARY,
          ),
          title: Text(
            title,
            style: const TextStyle(
              color: COLOR_DARK_ALT,
              fontSize: 20.0,
            ),
          ),
          onTap: () => onTap(),
        ),
        if (subTiles!.isNotEmpty)
          const Divider(
            color: COLOR_GRAY,
            indent: 20,
            endIndent: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: subTiles!,
          ),
      ],
    );
  }
}
