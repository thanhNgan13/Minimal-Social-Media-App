import 'package:flutter/material.dart';
import 'package:minimal_social_media_app/provider/UserProvider.dart';
import 'package:minimal_social_media_app/views/components/my_drawer.dart';
import 'package:minimal_social_media_app/controllers/user_controller.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = AuthUserControllerGoogle.user;
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                user?.displayName ?? 'Tên người dùng',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              CircleAvatar(
                radius: 15,
                foregroundImage:
                    NetworkImage(user?.photoURL ?? 'đường_dẫn_ảnh_mặc_định'),
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
