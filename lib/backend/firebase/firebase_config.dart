import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyC-bc32XsKFZxm0V29pOt_mmQc2APQmvYM",
            authDomain: "louetonbien-7f14f.firebaseapp.com",
            projectId: "louetonbien-7f14f",
            storageBucket: "louetonbien-7f14f.firebasestorage.app",
            messagingSenderId: "240194111803",
            appId: "1:240194111803:web:091d43595ddc15cc998f1e",
            measurementId: "G-X9KDWG0P38"));
  } else {
    await Firebase.initializeApp();
  }
}
