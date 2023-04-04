import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:otp_flutter_test/features/score/view/pages/score_page.dart';

void main() {
  group('ScorePage', skip: true, () {
    Widget createWidgetUnderTest() {
      return const MaterialApp(home: ScorePage());
    }

    testWidgets('', (WidgetTester widgetTester) async {
      await widgetTester.pumpWidget(createWidgetUnderTest());
    });
  });
}
