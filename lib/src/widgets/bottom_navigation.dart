import 'package:flutter/material.dart';
import 'package:to_do_zen/src/constants/colors.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return NavigationBarTheme(
      data: NavigationBarThemeData(
        indicatorColor: Colors.transparent,
        labelTextStyle: MaterialStateProperty.all(
          const TextStyle(
            color: COLOR_PRIMARY,
            fontSize: 15.0,
          ),
        ),
      ),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: COLOR_GRAY,
              blurRadius: 5,
            ),
          ],
        ),
        child: NavigationBar(
          backgroundColor: COLOR_LIGHT,
          height: size.height * 0.07,
          elevation: 2,
          destinations: [
            const IconButton(
              onPressed: null,
              icon: Icon(
                Icons.home_outlined,
                color: COLOR_PRIMARY,
              ),
              selectedIcon: Icon(
                Icons.home_filled,
                color: COLOR_PRIMARY,
              ),
            ),
            const IconButton(
              onPressed: null,
              icon: Icon(
                Icons.calendar_month_outlined,
                color: COLOR_PRIMARY,
              ),
              selectedIcon: Icon(
                Icons.calendar_month,
                color: COLOR_PRIMARY,
              ),
            ),
            SizedBox(
              width: size.width * 0.01,
            ),
            const IconButton(
              onPressed: null,
              icon: Icon(
                Icons.watch_later_outlined,
                color: COLOR_PRIMARY,
              ),
              selectedIcon: Icon(
                Icons.watch_later,
                color: COLOR_PRIMARY,
              ),
            ),
            IconButton(
              onPressed: () => Navigator.pushNamed(context, '/user_profile'),
              icon: Icon(
                Icons.person_2_outlined,
                color: COLOR_PRIMARY,
              ),
              selectedIcon: Icon(
                Icons.person_2,
                color: COLOR_PRIMARY,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
