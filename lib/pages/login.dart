import 'package:flutter/material.dart';
import 'package:minimal_social_media_app/components/my_button.dart';
import 'package:minimal_social_media_app/components/my_textfield.dart';

class LoginPage extends StatefulWidget {
  // sự kiện khi nhấn nút đăng ki
  final void Function()? onPressed;

  LoginPage({super.key, this.onPressed});

  // trình điều khiển cho các trường văn bản
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // logo
                Icon(Icons.person,
                    size: 80,
                    color: Theme.of(context).colorScheme.inversePrimary),

                const SizedBox(
                  height: 50,
                ),

                // App name
                const Text(
                  "M I N I M A L",
                  style: TextStyle(fontSize: 20),
                ),

                const SizedBox(
                  height: 20,
                ),

                MyTextField(
                    hintText: "Email",
                    obscureText: false,
                    controller: widget.emailcontroller),

                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                    hintText: "Password",
                    obscureText: true,
                    controller: widget.passwordcontroller),

                const SizedBox(
                  height: 20,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot Password?",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),

                MyButton(text: "Login", onPressed: () {}),

                const SizedBox(
                  height: 20,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    GestureDetector(
                      onTap: widget.onPressed,
                      child: Text(
                        " Sign Up",
                        style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
