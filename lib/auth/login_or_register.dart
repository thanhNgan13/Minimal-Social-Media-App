import 'package:flutter/material.dart';

import '../pages/login.dart';
import '../pages/register.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  // Trạng thái ban đầu sẽ là page đăng nhậ
  bool isLoginPage = true;

  // Hàm chuyển đổi giữa 2 trang đăng nhập và đăng ký
  void switchPage() {
    setState(() {
      isLoginPage = !isLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoginPage) {
      return LoginPage(onPressed: switchPage);
    } else {
      return RegisterPage(onPressed: switchPage);
    }
  }
}
