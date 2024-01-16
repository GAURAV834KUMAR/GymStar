import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCEFjOn7gA2dKq8qYSA9Q6Ry8lQaeFPYZQ",
            authDomain: "instagramclone-e17b6.firebaseapp.com",
            projectId: "instagramclone-e17b6",
            storageBucket: "instagramclone-e17b6.appspot.com",
            messagingSenderId: "291152191748",
            appId: "1:291152191748:web:e545b718d2d3c93c7bb051",
            measurementId: "G-J7SMYSNV1H"));
  } else {
    await Firebase.initializeApp();
  }
}
