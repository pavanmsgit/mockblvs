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
    apiKey: 'AIzaSyCPI5tyElTZBj1ITZCaC07zbh1u_MzjG2o',
    appId: '1:379047197851:web:c080054c81c27607a9da3e',
    messagingSenderId: '379047197851',
    projectId: 'exceltofirestore-dce8d',
    authDomain: 'exceltofirestore-dce8d.firebaseapp.com',
    storageBucket: 'exceltofirestore-dce8d.appspot.com',
    measurementId: 'G-JF8TB0N52V',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA_J8cNKvvKYUKWp8soT28V6v4wJTLZMRM',
    appId: '1:379047197851:android:62cb80553af40a7aa9da3e',
    messagingSenderId: '379047197851',
    projectId: 'exceltofirestore-dce8d',
    storageBucket: 'exceltofirestore-dce8d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBKzVvWqFtvfW_Apl4Paqe7KaFJ3mKiLEc',
    appId: '1:379047197851:ios:c1ff0aa7485f2441a9da3e',
    messagingSenderId: '379047197851',
    projectId: 'exceltofirestore-dce8d',
    storageBucket: 'exceltofirestore-dce8d.appspot.com',
    iosBundleId: 'damn.dudes.mockblvs',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBKzVvWqFtvfW_Apl4Paqe7KaFJ3mKiLEc',
    appId: '1:379047197851:ios:f8360e072f21e056a9da3e',
    messagingSenderId: '379047197851',
    projectId: 'exceltofirestore-dce8d',
    storageBucket: 'exceltofirestore-dce8d.appspot.com',
    iosBundleId: 'damn.dudes.mockblvs.RunnerTests',
  );
}