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
        decoration: const BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: COLOR_GRAY,
              blurRadius: 2,
            ),
          ],
        ),
        child: NavigationBar(
          height: size.height * 0.08,
          shadowColor: COLOR_DARK_ALT,
          elevation: 10,
          backgroundColor: COLOR_LIGHT,
          destinations: [
            const NavigationDestination(
              icon: Icon(
                Icons.home_outlined,
                color: COLOR_PRIMARY,
              ),
              selectedIcon: Icon(
                Icons.home_filled,
                color: COLOR_PRIMARY,
              ),
              label: 'Home',
            ),
            const NavigationDestination(
              icon: Icon(
                Icons.calendar_month_outlined,
                color: COLOR_PRIMARY,
              ),
              selectedIcon: Icon(
                Icons.calendar_month,
                color: COLOR_PRIMARY,
              ),
              label: 'Calendar',
            ),
            SizedBox(
              width: size.width * 0.01,
            ),
            const NavigationDestination(
              icon: Icon(
                Icons.watch_later_outlined,
                color: COLOR_PRIMARY,
              ),
              selectedIcon: Icon(
                Icons.watch_later,
                color: COLOR_PRIMARY,
              ),
              label: 'Home',
            ),
            const NavigationDestination(
              icon: Icon(
                Icons.person_2_outlined,
                color: COLOR_PRIMARY,
              ),
              selectedIcon: Icon(
                Icons.person_2,
                color: COLOR_PRIMARY,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
