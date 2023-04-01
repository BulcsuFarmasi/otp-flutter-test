import 'package:flutter/material.dart';
import 'package:otp_flutter_test/features/input/view/widgets/feedback_text.dart';
import 'package:otp_flutter_test/features/input/view/widgets/word_form.dart';
import 'package:otp_flutter_test/shared/app_drawer.dart';

class InputPage extends StatelessWidget {
  const InputPage({super.key});

  static const routeName = '/input';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        drawer: const AppDrawer(),
        body: Column(
          children: const [
            WordForm(),
            FeedbackText(),
          ],
        ));
  }
}
