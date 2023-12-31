// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBYsfA0KH_D4ivUaNjHFiaricRNdO80sXc',
    appId: '1:270324790182:web:c81f88fac30776524a5567',
    messagingSenderId: '270324790182',
    projectId: 'to-do-zen',
    authDomain: 'to-do-zen.firebaseapp.com',
    storageBucket: 'to-do-zen.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCmHtwlqOiqnjkQ_fgvh-X56zdN32WjmMs',
    appId: '1:270324790182:android:e01749201a3afb584a5567',
    messagingSenderId: '270324790182',
    projectId: 'to-do-zen',
    storageBucket: 'to-do-zen.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDBacx3mGwdyUHeOu8S5DTYOaY5aJKDw-k',
    appId: '1:270324790182:ios:4e7faa270d4338f04a5567',
    messagingSenderId: '270324790182',
    projectId: 'to-do-zen',
    storageBucket: 'to-do-zen.appspot.com',
    iosBundleId: 'com.example.toDoZen',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDBacx3mGwdyUHeOu8S5DTYOaY5aJKDw-k',
    appId: '1:270324790182:ios:4e7faa270d4338f04a5567',
    messagingSenderId: '270324790182',
    projectId: 'to-do-zen',
    storageBucket: 'to-do-zen.appspot.com',
    iosBundleId: 'com.example.toDoZen',
  );
}
