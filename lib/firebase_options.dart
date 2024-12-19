// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCq_Lb2K_0GfrTXCBKk4D1hDh0kG1-MJvE',
    appId: '1:53066265798:web:bfdcc1003ec94583dc53c7',
    messagingSenderId: '53066265798',
    projectId: 'quizapp-c250d',
    authDomain: 'quizapp-c250d.firebaseapp.com',
    storageBucket: 'quizapp-c250d.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC_tFEOvxG8xy8E2bjJY_ZUsmfM4fZpY9A',
    appId: '1:53066265798:android:7f4be9d35a8a3386dc53c7',
    messagingSenderId: '53066265798',
    projectId: 'quizapp-c250d',
    storageBucket: 'quizapp-c250d.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCUWybYuLfCxaPfV-sRdBnYXnlepqHWkMM',
    appId: '1:53066265798:ios:d3c8cd7f05db9436dc53c7',
    messagingSenderId: '53066265798',
    projectId: 'quizapp-c250d',
    storageBucket: 'quizapp-c250d.firebasestorage.app',
    iosBundleId: 'com.example.quizappQuizzapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCUWybYuLfCxaPfV-sRdBnYXnlepqHWkMM',
    appId: '1:53066265798:ios:d3c8cd7f05db9436dc53c7',
    messagingSenderId: '53066265798',
    projectId: 'quizapp-c250d',
    storageBucket: 'quizapp-c250d.firebasestorage.app',
    iosBundleId: 'com.example.quizappQuizzapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCq_Lb2K_0GfrTXCBKk4D1hDh0kG1-MJvE',
    appId: '1:53066265798:web:f51410bf714c2e9adc53c7',
    messagingSenderId: '53066265798',
    projectId: 'quizapp-c250d',
    authDomain: 'quizapp-c250d.firebaseapp.com',
    storageBucket: 'quizapp-c250d.firebasestorage.app',
  );
}
