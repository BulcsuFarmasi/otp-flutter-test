import 'package:flutter/material.dart';
import 'package:otp_flutter_test/features/input/view/pages/input_page.dart';
import 'package:otp_flutter_test/features/score/view/pages/score_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0xFF52AE30)
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const InputPage(),
        InputPage.routeName: (_) => const InputPage(),
        ScorePage.routeName: (_) => const ScorePage(),
      },
    );
  }
}
