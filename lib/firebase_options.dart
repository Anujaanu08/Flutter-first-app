import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return const FirebaseOptions(
        apiKey: "AIzaSyApzFN7KNFl-O3Bz6Aog3F_PAtpsi3icMI",
        authDomain: "flutter-firebase-final-e9774.firebaseapp.com",
        projectId: "flutter-firebase-final-e9774",
        storageBucket: "flutter-firebase-final-e9774.firebasestorage.app",
        messagingSenderId: "994973236551",
        appId: "1:994973236551:android:184ebba838ca726556a062",
      );
    } else {
      return const FirebaseOptions(
        apiKey: "AIzaSyApzFN7KNFl-O3Bz6Aog3F_PAtpsi3icMI",
        appId: "1:994973236551:android:184ebba838ca726556a062",
        messagingSenderId: "994973236551",
        projectId: "flutter-firebase-final-e9774",
        storageBucket: "flutter-firebase-final-e9774.firebasestorage.app",
      );
    }
  }
}
