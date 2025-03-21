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
    apiKey: 'AIzaSyD9MrbwZ80xk9l0r8y7ZpTu0xIMahb3rEw',
    appId: '1:156427054763:web:74f50d5074dcfb34d191ee',
    messagingSenderId: '156427054763',
    projectId: 'mobileprogrammingproject-103c2',
    authDomain: 'mobileprogrammingproject-103c2.firebaseapp.com',
    storageBucket: 'mobileprogrammingproject-103c2.firebasestorage.app',
    measurementId: 'G-JXLL788FSG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDY28Q0fjwQNUMRSi15CriPQoenS7J3pdE',
    appId: '1:156427054763:android:f2c82439ce1a2e8ad191ee',
    messagingSenderId: '156427054763',
    projectId: 'mobileprogrammingproject-103c2',
    storageBucket: 'mobileprogrammingproject-103c2.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyANn5H-SbCgQlu9sy0gVfTO0eAMkWueoxI',
    appId: '1:156427054763:ios:caca5d099309e540d191ee',
    messagingSenderId: '156427054763',
    projectId: 'mobileprogrammingproject-103c2',
    storageBucket: 'mobileprogrammingproject-103c2.firebasestorage.app',
    iosBundleId: 'com.example.flutter37hours',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyANn5H-SbCgQlu9sy0gVfTO0eAMkWueoxI',
    appId: '1:156427054763:ios:caca5d099309e540d191ee',
    messagingSenderId: '156427054763',
    projectId: 'mobileprogrammingproject-103c2',
    storageBucket: 'mobileprogrammingproject-103c2.firebasestorage.app',
    iosBundleId: 'com.example.flutter37hours',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD9MrbwZ80xk9l0r8y7ZpTu0xIMahb3rEw',
    appId: '1:156427054763:web:aa5547ce0c031bf3d191ee',
    messagingSenderId: '156427054763',
    projectId: 'mobileprogrammingproject-103c2',
    authDomain: 'mobileprogrammingproject-103c2.firebaseapp.com',
    storageBucket: 'mobileprogrammingproject-103c2.firebasestorage.app',
    measurementId: 'G-1JBBMG0GMV',
  );
}
