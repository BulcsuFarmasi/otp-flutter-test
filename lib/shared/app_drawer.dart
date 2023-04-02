import 'package:flutter/material.dart';
import 'package:otp_flutter_test/features/input/view/pages/input_page.dart';
import 'package:otp_flutter_test/features/score/view/pages/score_page.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  void _navigate(NavigatorState navigator, String target) {
    navigator.pop();
    navigator.pushNamed(target);
  }

  @override
  Widget build(BuildContext context) {
    final NavigatorState navigator = Navigator.of(context);
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            title: const Text('Input'),
            onTap: () {
              _navigate(navigator, InputPage.routeName);
            },
          ),
          ListTile(
            title: const Text('Score'),
            onTap: () {
              _navigate(navigator, ScorePage.routeName);
            },
          ),
        ],
      ),
    );
  }
}
