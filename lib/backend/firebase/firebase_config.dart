import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAKz1XZxVGfK8NIGrbqk5VQo3OZun2ein0",
            authDomain: "sihapp-b313d.firebaseapp.com",
            projectId: "sihapp-b313d",
            storageBucket: "sihapp-b313d.appspot.com",
            messagingSenderId: "613172470025",
            appId: "1:613172470025:web:622139a079b780beb573d8"));
  } else {
    await Firebase.initializeApp();
  }
}
