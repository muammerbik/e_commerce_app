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
    apiKey: 'AIzaSyDksaK33rntFdXu2D5zlHlBsbd0S3GkpHY',
    appId: '1:573916103767:web:0ab2cfc8f869e692c0cf12',
    messagingSenderId: '573916103767',
    projectId: 'flutter-one-signal-2c838',
    authDomain: 'flutter-one-signal-2c838.firebaseapp.com',
    storageBucket: 'flutter-one-signal-2c838.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCZLb9J2a5UJsWoDqOC8ygDZsipVjtab28',
    appId: '1:573916103767:android:5f7b07662b42e5d9c0cf12',
    messagingSenderId: '573916103767',
    projectId: 'flutter-one-signal-2c838',
    storageBucket: 'flutter-one-signal-2c838.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA-fj5xRgsHbBCSuoR8pVJmKNEK5ityi7s',
    appId: '1:573916103767:ios:79a213d0087e92d3c0cf12',
    messagingSenderId: '573916103767',
    projectId: 'flutter-one-signal-2c838',
    storageBucket: 'flutter-one-signal-2c838.appspot.com',
    iosBundleId: 'com.example.onesignalFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA-fj5xRgsHbBCSuoR8pVJmKNEK5ityi7s',
    appId: '1:573916103767:ios:473c93da6233b1bac0cf12',
    messagingSenderId: '573916103767',
    projectId: 'flutter-one-signal-2c838',
    storageBucket: 'flutter-one-signal-2c838.appspot.com',
    iosBundleId: 'com.example.onesignalFlutter.RunnerTests',
  );
}