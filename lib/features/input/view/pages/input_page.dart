import 'package:flutter/material.dart';
import 'package:otp_flutter_test/shared/app_drawer.dart';

class InputPage extends StatelessWidget {
  const InputPage({super.key});

  static const routeName = '/input';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text('Input'),
      ),
    );
  }
}
