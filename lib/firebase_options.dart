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
    apiKey: 'AIzaSyBgENXb9S-y4Xna1_raZr2RgkLmMcbDqlE',
    appId: '1:591321821450:web:d7a36df6a55a95df344af3',
    messagingSenderId: '591321821450',
    projectId: 'billsplit-a4e6c',
    authDomain: 'billsplit-a4e6c.firebaseapp.com',
    storageBucket: 'billsplit-a4e6c.firebasestorage.app',
    measurementId: 'G-6SHT0PWQTW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCbQrW0xGCerLqeNliTKHsJ3OooZcuFpk0',
    appId: '1:591321821450:android:6be1128d3c9079e7344af3',
    messagingSenderId: '591321821450',
    projectId: 'billsplit-a4e6c',
    storageBucket: 'billsplit-a4e6c.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC3ggAnt2vY0kCJlxldO5QMcQogOOTPs_M',
    appId: '1:591321821450:ios:efe52eb63d72afab344af3',
    messagingSenderId: '591321821450',
    projectId: 'billsplit-a4e6c',
    storageBucket: 'billsplit-a4e6c.firebasestorage.app',
    iosBundleId: 'com.example.billsplitApk',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC3ggAnt2vY0kCJlxldO5QMcQogOOTPs_M',
    appId: '1:591321821450:ios:efe52eb63d72afab344af3',
    messagingSenderId: '591321821450',
    projectId: 'billsplit-a4e6c',
    storageBucket: 'billsplit-a4e6c.firebasestorage.app',
    iosBundleId: 'com.example.billsplitApk',
  );
}