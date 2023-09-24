import 'package:flutter/material.dart';
import 'package:to_do_zen/src/constants/colors.dart';

class DrawerMenuSubItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onTap;
  const DrawerMenuSubItem({
    required this.title,
    required this.icon,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListTile(
      leading: Icon(icon),
      contentPadding: EdgeInsets.only(
        left: size.width * 0.1,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 15.0,
          color: COLOR_PRIMARY,
        ),
      ),
      onTap: onTap(),
    );
  }
}
