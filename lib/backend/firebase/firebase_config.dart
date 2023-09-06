import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCEFjOn7gA2dKq8qYSA9Q6Ry8lQaeFPYZQ",
            authDomain: "instagramclone-e17b6.firebaseapp.com",
            projectId: "instagramclone-e17b6",
            storageBucket: "instagramclone-e17b6.appspot.com",
            messagingSenderId: "291152191748",
            appId: "1:291152191748:web:e0376b6f556050c27bb051",
            measurementId: "G-RYGNENVQ4Z"));
  } else {
    await Firebase.initializeApp();
  }
}
