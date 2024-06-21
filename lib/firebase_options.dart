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
    apiKey: 'AIzaSyDD9YISWkb1mqGsVNfUnNnK1r1W0oiWlmk',
    appId: '1:587919313088:web:4ce7b92dcb0a2c0d95c525',
    messagingSenderId: '587919313088',
    projectId: 'guideme-1d9c7',
    authDomain: 'guideme-1d9c7.firebaseapp.com',
    databaseURL: 'https://guideme-1d9c7.firebaseio.com',
    storageBucket: 'guideme-1d9c7.appspot.com',
    measurementId: 'G-7SWN4EWLN0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBM6YiAIj9LTqbhrWBpOWDB7U3c8Q1dGQY',
    appId: '1:587919313088:android:d14ce4d5a255207b95c525',
    messagingSenderId: '587919313088',
    projectId: 'guideme-1d9c7',
    databaseURL: 'https://guideme-1d9c7.firebaseio.com',
    storageBucket: 'guideme-1d9c7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBfMBALs8ge0iiJGiwVRqAXWR6DgZrcwTg',
    appId: '1:587919313088:ios:7e0b77b71747ed1c95c525',
    messagingSenderId: '587919313088',
    projectId: 'guideme-1d9c7',
    databaseURL: 'https://guideme-1d9c7.firebaseio.com',
    storageBucket: 'guideme-1d9c7.appspot.com',
    iosBundleId: 'com.example.flutterProblem',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBfMBALs8ge0iiJGiwVRqAXWR6DgZrcwTg',
    appId: '1:587919313088:ios:7e0b77b71747ed1c95c525',
    messagingSenderId: '587919313088',
    projectId: 'guideme-1d9c7',
    databaseURL: 'https://guideme-1d9c7.firebaseio.com',
    storageBucket: 'guideme-1d9c7.appspot.com',
    iosBundleId: 'com.example.flutterProblem',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDD9YISWkb1mqGsVNfUnNnK1r1W0oiWlmk',
    appId: '1:587919313088:web:3dd37af55be1a31395c525',
    messagingSenderId: '587919313088',
    projectId: 'guideme-1d9c7',
    authDomain: 'guideme-1d9c7.firebaseapp.com',
    databaseURL: 'https://guideme-1d9c7.firebaseio.com',
    storageBucket: 'guideme-1d9c7.appspot.com',
    measurementId: 'G-RFJ74WWYHV',
  );
}
