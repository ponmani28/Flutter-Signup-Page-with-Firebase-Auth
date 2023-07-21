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
    apiKey: 'AIzaSyCo3kIkm2phP48g8hs2sP2NHr9-DB29XNU',
    appId: '1:434746239384:web:485695b0f90ffcbc10e3ed',
    messagingSenderId: '434746239384',
    projectId: 'loginpage-aa0c6',
    authDomain: 'loginpage-aa0c6.firebaseapp.com',
    storageBucket: 'loginpage-aa0c6.appspot.com',
    measurementId: 'G-M8F5CYSQQH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDeQ-due4vQY24euSo05uiLiJ5CdWyVNpI',
    appId: '1:434746239384:android:91518faa5750952010e3ed',
    messagingSenderId: '434746239384',
    projectId: 'loginpage-aa0c6',
    storageBucket: 'loginpage-aa0c6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAkLKQmOp3_VDNQW-qDO4S3eljViQMKC8s',
    appId: '1:434746239384:ios:76c77e980f399b9f10e3ed',
    messagingSenderId: '434746239384',
    projectId: 'loginpage-aa0c6',
    storageBucket: 'loginpage-aa0c6.appspot.com',
    iosClientId: '434746239384-fmqec30jr8eilvve0fmbahm6hui3kgft.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAkLKQmOp3_VDNQW-qDO4S3eljViQMKC8s',
    appId: '1:434746239384:ios:3877ba8399c6ee7810e3ed',
    messagingSenderId: '434746239384',
    projectId: 'loginpage-aa0c6',
    storageBucket: 'loginpage-aa0c6.appspot.com',
    iosClientId: '434746239384-hlfs5qegsdkrkvsg8mu0v6o7jp9uf82d.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseapp.RunnerTests',
  );
}
