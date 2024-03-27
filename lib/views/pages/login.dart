import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minimal_social_media_app/views/components/my_button.dart';
import 'package:minimal_social_media_app/views/components/my_textfield.dart';
import 'package:minimal_social_media_app/controllers/user_controller.dart';
import 'package:minimal_social_media_app/helper/helper_function.dart';
import 'package:minimal_social_media_app/views/pages/home.dart';

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
  void login() async {
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: widget.emailcontroller.text,
          password: widget.passwordcontroller.text);
      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      displayMessageToUser(e.code, context);
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
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  MyButton(text: "Login", onPressed: login),

                  const SizedBox(
                    height: 50,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Or login with",
                          style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .inversePrimary)),
                    ],
                  ),

                  const SizedBox(
                    height: 50,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // nút đăng nhập bằng facebook
                      GestureDetector(
                        onTap: () async {},
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Icon(
                            size: 40,
                            Icons.facebook,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      // nút đăng nhập bằng google
                      GestureDetector(
                        onTap: () async {
                          showDialog(
                              context: context,
                              builder: (context) => const Center(
                                    child: CircularProgressIndicator(),
                                  ));
                          try {
                            // Attempt to sign in with Google
                            final UserCredential userCredential =
                                await AuthUserControllerGoogle
                                    .signInWithGoogle();
                            await AuthUserControllerGoogle.saveUserData(
                                userCredential.user);
                            if (context.mounted) {
                              Navigator.of(context).pop();
                            }
                          } on FirebaseAuthException catch (e) {
                            Navigator.pop(context);
                            print(e.toString());
                            displayMessageToUser(e.toString(), context);
                          } catch (e) {
                            Navigator.pop(context);
                            print(e.toString());
                            displayMessageToUser(e.toString(), context);
                          }
                        },
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Icon(
                            size: 50,
                            Icons.g_mobiledata,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 50,
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
          ),
        ));
  }
}
