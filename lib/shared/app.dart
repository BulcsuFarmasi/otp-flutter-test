import 'package:flutter/material.dart';
import 'package:otp_flutter_test/features/score/view/pages/score_page.dart';
import 'package:otp_flutter_test/features/word/view/pages/word_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: _lightGreen),
      initialRoute: '/',
      routes: {
        '/': (_) => const WordPage(),
        WordPage.routeName: (_) => const WordPage(),
        ScorePage.routeName: (_) => const ScorePage(),
      },
    );
  }
}

const MaterialColor _lightGreen = MaterialColor(_lightGreenPrimaryValue, <int, Color>{
  50: Color(0xFFEAF5E6),
  100: Color(0xFFCBE7C1),
  200: Color(0xFFA9D798),
  300: Color(0xFF86C66E),
  400: Color(0xFF6CBA4F),
  500: Color(_lightGreenPrimaryValue),
  600: Color(0xFF4BA72B),
  700: Color(0xFF419D24),
  800: Color(0xFF38941E),
  900: Color(0xFF288413),
});
const int _lightGreenPrimaryValue = 0xFF52AE30;
