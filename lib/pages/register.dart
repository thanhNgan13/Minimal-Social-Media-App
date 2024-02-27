import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  // Trình điều khiển cho các trường văn bản
  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController confirmpasswordcontroller =
      TextEditingController();

  final void Function()? onPressed;

  RegisterPage({super.key, this.onPressed});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // logo
                  Icon(Icons.person,
                      size: 80,
                      color: Theme.of(context).colorScheme.inversePrimary),

                  const SizedBox(
                    height: 30,
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
                      hintText: "Username",
                      obscureText: false,
                      controller: widget.emailcontroller),

                  const SizedBox(
                    height: 10,
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
                    height: 10,
                  ),
                  MyTextField(
                      hintText: "Confirm Password",
                      obscureText: true,
                      controller: widget.confirmpasswordcontroller),

                  const SizedBox(
                    height: 20,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot Password?",
                        style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  MyButton(text: "Register", onPressed: () {}),

                  const SizedBox(
                    height: 20,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                      GestureDetector(
                        onTap: widget.onPressed,
                        child: Text(
                          " Sign In",
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
          ),
        ));
  }
}
