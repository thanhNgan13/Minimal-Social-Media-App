import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:minimal_social_media_app/auth/auth.dart';
import 'package:minimal_social_media_app/theme/light_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyCbPCDFtTXU2Iw_VH1a_EHdtfWrNbXBxsE',
          appId: '1:15644102148:android:632e866b989e8608ab6f51',
          messagingSenderId: '15644102148',
          projectId: 'minimal-social-media-e3ea1'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      // darkTheme: darkMode,
      home: const AuthPage(),
    );
  }
}
