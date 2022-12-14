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
    apiKey: 'AIzaSyDpXhveLsr9bqGsdJ5DpRpedMCwMMibY-M',
    appId: '1:729964981527:web:85844eb7d5a2ecff029b52',
    messagingSenderId: '729964981527',
    projectId: 'track1-db',
    authDomain: 'track1-db.firebaseapp.com',
    storageBucket: 'track1-db.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDewl-9LOBVkEArkW3Q9NEgP6fugOMrh2Q',
    appId: '1:729964981527:android:93fb6536ba4dd406029b52',
    messagingSenderId: '729964981527',
    projectId: 'track1-db',
    storageBucket: 'track1-db.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC1GNasHBrpXBbXX0Saf3tNWW3CZlcaq1k',
    appId: '1:729964981527:ios:7d4ea8c83f2b5693029b52',
    messagingSenderId: '729964981527',
    projectId: 'track1-db',
    storageBucket: 'track1-db.appspot.com',
    iosClientId: '729964981527-l626sbd5u9a71a5l8i4tsp1go772j7qr.apps.googleusercontent.com',
    iosBundleId: 'com.example.track1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC1GNasHBrpXBbXX0Saf3tNWW3CZlcaq1k',
    appId: '1:729964981527:ios:7d4ea8c83f2b5693029b52',
    messagingSenderId: '729964981527',
    projectId: 'track1-db',
    storageBucket: 'track1-db.appspot.com',
    iosClientId: '729964981527-l626sbd5u9a71a5l8i4tsp1go772j7qr.apps.googleusercontent.com',
    iosBundleId: 'com.example.track1',
  );
}
