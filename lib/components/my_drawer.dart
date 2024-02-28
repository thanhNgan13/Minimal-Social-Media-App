import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
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
        myCustomListTileForDrawer(context, "L O G O U T", Icons.home),
      ]),
    );
  }

  Padding myCustomListTileForDrawer(
      BuildContext context, String titlte, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: ListTile(
        leading: Icon(
          icon,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        title: Text(titlte),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
