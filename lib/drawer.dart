import 'package:flutter/material.dart';
import 'package:rbk/widget/createDrawerBodyItem.dart';
import 'package:rbk/pageRoutes.dart';

class MyDrawer extends StatefulWidget {
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text("Ooha"),
            accountEmail: Text("goohashree@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage:
                  NetworkImage("https://unsplash.com/photos/fxOE7y8HmQ8"),
            ),
          ),
          createDrawerBodyItem(
            icon: Icons.report,
            text: 'Seasonal Conditional Report',
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.home),
          ),
          createDrawerBodyItem(
            icon: Icons.account_circle,
            text: 'Village Profile',
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.profile),
          ),
          createDrawerBodyItem(
            icon: Icons.event_note,
            text: 'Sales',
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.sale),
          ),
          createDrawerBodyItem(
            icon: Icons.notifications_active,
            text: 'Remainders',
            onTap: () => Navigator.pushReplacementNamed(
                context, pageRoutes.notification),
          ),
          createDrawerBodyItem(
            icon: Icons.contact_phone,
            text: 'Fertilizers',
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.avail),
          ),
          ListTile(
            title: Text('App version 1.0.0'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
