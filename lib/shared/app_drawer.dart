import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          ListTile(
            title: Text('Input'),
          ),
          ListTile(
            title: Text('Score'),
          ),
        ],
      ),
    );
  }
}
