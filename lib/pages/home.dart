import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minimal_social_media_app/components/my_drawer.dart';
import 'package:minimal_social_media_app/controllers/user_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Home',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              CircleAvatar(
                radius: 15,
                foregroundImage:
                    NetworkImage(UserController.user?.photoURL ?? ''),
              )
            ],
          ),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          // Đặt màu sắc cho icon
          iconTheme: IconThemeData(
            color: Theme.of(context)
                .colorScheme
                .secondary, // Chọn màu cho icon ở đây
          ),
        ),
        drawer: const MyDrawer());
  }
}
