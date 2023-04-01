import 'package:flutter/material.dart';
import 'package:otp_flutter_test/shared/app_drawer.dart';

class ScorePage extends StatelessWidget {
  const ScorePage({super.key});

  static const routeName = '/score';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text('Input'),
      ),
    );
  }
}
