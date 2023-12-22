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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAG-aQwrEGoP2wc4U3oK6DTSAvWWT1TRWI',
    appId: '1:773870966171:web:0029cd4a017b55cce4fd3e',
    messagingSenderId: '773870966171',
    projectId: 'pessoal-61cbe',
    authDomain: 'pessoal-61cbe.firebaseapp.com',
    storageBucket: 'pessoal-61cbe.appspot.com',
    measurementId: 'G-FC1HW4K0BK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCjpAmGJ8_I8P4QVYknzGfBl9amdHgCq6g',
    appId: '1:773870966171:android:e6a3997e006f0ef1e4fd3e',
    messagingSenderId: '773870966171',
    projectId: 'pessoal-61cbe',
    storageBucket: 'pessoal-61cbe.appspot.com',
  );
}
