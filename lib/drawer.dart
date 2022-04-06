import 'package:flutter/material.dart';
import 'package:rbk/cardWidget.dart';
import 'package:rbk/notificationPage.dart';
import 'package:rbk/sales.dart';
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
            accountEmail: Text("xxxxxxxx.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://w7.pngwing.com/pngs/81/570/png-transparent-profile-logo-computer-icons-user-user-blue-heroes-logo-thumbnail.png"),
            ),
          ),
          createDrawerBodyItem(
              icon: Icons.report,
              text: 'Seasonal Conditional Report',
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => notificationPage())),
                  )),
          createDrawerBodyItem(
              icon: Icons.account_circle,
              text: 'Village Profile',
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => notificationPage())),
                  )),
          createDrawerBodyItem(
              icon: Icons.history,
              text: 'Sales',
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: ((context) => sales())),
                  )),
          createDrawerBodyItem(
              icon: Icons.notifications_active,
              text: 'Remainders',
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => notificationPage())),
                  )),
          createDrawerBodyItem(
              icon: Icons.menu_book_outlined,
              text: 'Fertilizers',
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: ((context) => GridScreen())),
                  )),
        ],
      ),
    );
  }
}
