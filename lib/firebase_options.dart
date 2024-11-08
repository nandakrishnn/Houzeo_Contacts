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
    apiKey: 'AIzaSyAZZAr7AH77nhy_M_qUXdqrwOhqXrUsDWE',
    appId: '1:5258189836:web:00f0d52eede4412fe2a229',
    messagingSenderId: '5258189836',
    projectId: 'houzeocontacts-5599e',
    authDomain: 'houzeocontacts-5599e.firebaseapp.com',
    storageBucket: 'houzeocontacts-5599e.firebasestorage.app',
    measurementId: 'G-PFKNLCEREV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCRTp-Rk0KoU9vPw-q5ivw-U8yAPbc-_58',
    appId: '1:5258189836:android:aa4dd088e2722c0ce2a229',
    messagingSenderId: '5258189836',
    projectId: 'houzeocontacts-5599e',
    storageBucket: 'houzeocontacts-5599e.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC_2-aizyTtXxJhuweqzPE2GK0PL2ZMImQ',
    appId: '1:5258189836:ios:add0d7f94d228a59e2a229',
    messagingSenderId: '5258189836',
    projectId: 'houzeocontacts-5599e',
    storageBucket: 'houzeocontacts-5599e.firebasestorage.app',
    iosBundleId: 'com.example.houzeocontacts',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC_2-aizyTtXxJhuweqzPE2GK0PL2ZMImQ',
    appId: '1:5258189836:ios:add0d7f94d228a59e2a229',
    messagingSenderId: '5258189836',
    projectId: 'houzeocontacts-5599e',
    storageBucket: 'houzeocontacts-5599e.firebasestorage.app',
    iosBundleId: 'com.example.houzeocontacts',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAZZAr7AH77nhy_M_qUXdqrwOhqXrUsDWE',
    appId: '1:5258189836:web:9b2cdec384e566a5e2a229',
    messagingSenderId: '5258189836',
    projectId: 'houzeocontacts-5599e',
    authDomain: 'houzeocontacts-5599e.firebaseapp.com',
    storageBucket: 'houzeocontacts-5599e.firebasestorage.app',
    measurementId: 'G-1D3PG8TCD8',
  );

}