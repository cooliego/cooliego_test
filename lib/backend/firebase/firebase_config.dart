import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCqY_aBN7_H7_PkCend69awgwIGiFAWCY4",
            authDomain: "cooliego6969.firebaseapp.com",
            projectId: "cooliego6969",
            storageBucket: "cooliego6969.appspot.com",
            messagingSenderId: "887063257280",
            appId: "1:887063257280:web:4491e00fe1d3a05f710d25",
            measurementId: "G-1YM1MKFS0L"));
  } else {
    await Firebase.initializeApp();
  }
}
