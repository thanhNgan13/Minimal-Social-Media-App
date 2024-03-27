import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minimal_social_media_app/controllers/auth/login_or_register.dart';

import '../../views/pages/home.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            // Nguời dùng đăng nhập được
            if (snapshot.hasData) {
              return const HomePage();
            }
            // Người dùng không đăng nhập được
            else {
              return const LoginOrRegister();
            }
          }),
    );
  }
}
