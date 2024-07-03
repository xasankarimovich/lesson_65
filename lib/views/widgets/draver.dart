import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue.shade900,
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image.asset(AppImages.onHasan),
            const DrawerHeader(
              child: SizedBox(),
            ),
            ListTile(
              title: const Text(
                "Home",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () => Navigator.of(context).pushReplacement(
                CupertinoPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
