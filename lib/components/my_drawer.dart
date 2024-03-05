import 'package:flutter/material.dart';
import 'package:minimal_social_media_app/auth/auth.dart';
import 'package:minimal_social_media_app/controllers/user_controller.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primary,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          children: [
            DrawerHeader(
                child: Icon(
              Icons.favorite,
              color: Theme.of(context).colorScheme.inversePrimary,
            )),
            myCustomListTileForDrawer(context, "H O M E", Icons.home),
            myCustomListTileForDrawer(context, "P R O F I L E", Icons.person),
            myCustomListTileForDrawer(context, "U S E R S", Icons.group),
          ],
        ),
        myCustomListTileForDrawer(context, "L O G O U T", Icons.logout,
            onTap: () async {
          await UserController.logout();
          if (mounted) {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const AuthPage()));
          }
        }),
      ]),
    );
  }

  Padding myCustomListTileForDrawer(
      BuildContext context, String tittle, IconData icon,
      {Function()? onTap}) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: ListTile(
        leading: Icon(
          icon,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        title: Text(tittle),
        onTap: onTap,
      ),
    );
  }
}
