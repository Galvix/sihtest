import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyD771ACRa_8t29jlVQxwv5KPRMs0tCxxCM",
            authDomain: "sihtest-c10a1.firebaseapp.com",
            projectId: "sihtest-c10a1",
            storageBucket: "sihtest-c10a1.appspot.com",
            messagingSenderId: "969284250279",
            appId: "1:969284250279:web:d844f0087b3e755b000982"));
  } else {
    await Firebase.initializeApp();
  }
}
