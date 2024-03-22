import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minimal_social_media_app/helper/helper_function.dart';

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
  void registerUser() async {
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));

    // Kiểm tra xem password và confirm password có giống nhau không
    if (widget.passwordcontroller.text !=
        widget.confirmpasswordcontroller.text) {
      // Load vòng tròn
      Navigator.pop(context);
      displayMessageToUser("Password doest not correct ", context);
      return;
    } else {
      // try catch việc tạo mới user
      try {
        // code tạo mới user

        UserCredential? userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: widget.emailcontroller.text,
                password: widget.passwordcontroller.text);
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        displayMessageToUser(e.code, context);
      }
    }
  }

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
                      controller: widget.usernamecontroller),

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

                  MyButton(text: "Register", onPressed: registerUser),

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
