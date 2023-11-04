import 'package:flutter/material.dart';
import 'package:to_do_zen/src/constants/colors.dart';

class TDZAppBar extends StatefulWidget implements PreferredSizeWidget {
  const TDZAppBar({super.key});

  @override
  State<TDZAppBar> createState() => _TDZAppBarState();
  
  @override
  Size get preferredSize => const Size.fromHeight(55);
}

class _TDZAppBarState extends State<TDZAppBar> {
  @override
  Widget build(BuildContext context) {
    
    return AppBar(
        title: const Text('Home'),
        centerTitle: true,
        backgroundColor: COLOR_PRIMARY,
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.sort_rounded),
            );
          },
        ),
      );
  }
}