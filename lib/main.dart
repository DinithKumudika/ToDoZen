import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_zen/firebase_options.dart';
import 'package:to_do_zen/src/constants/colors.dart';
import 'package:to_do_zen/src/repositories/auth_repository.dart';
import 'package:to_do_zen/src/screens/splash_screen.dart';
import 'package:to_do_zen/src/utils/router.dart';
import 'package:to_do_zen/src/utils/routes.dart';

bool? isViewed;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(AuthRepository()));
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // application root
  @override
  Widget build(BuildContext context) {
    // instantiate the router and pass int the routes map
    final router = AppRouter(routes);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: 'ToDoZen',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: COLOR_PRIMARY,
      ),
      home: const SplashScreen(),
      // Use the onGenerateRoute callback to delegate the routing to the router
      onGenerateRoute: router.generateRoute,
    );
  }
}
