import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:otp_flutter_test/features/word/view/widgets/word_form.dart';

void main() {
  group('WordForm', () {
    Widget createWidgetUnderTest() {
      return const MaterialApp(
        home: Scaffold(
          body: WordForm(),
        ),
      );
    }

    testWidgets('should not display error when a valid input is given and a button is pressed',
        (WidgetTester widgetTester) async {
      await widgetTester.pumpWidget(createWidgetUnderTest());
      final Finder input = find.byType(TextFormField);
      final Finder button = find.byType(ElevatedButton);

      const String text = 'apple';

      await widgetTester.enterText(input, text);
      await widgetTester.tap(button);

      expect(find.text('The input is not a word'), findsNothing);
    });

    testWidgets('should no error when a valid input is given and a button is pressed',
        (WidgetTester widgetTester) async {
      await widgetTester.pumpWidget(createWidgetUnderTest());
      final Finder input = find.byType(TextFormField);
      final Finder button = find.byType(ElevatedButton);

      const String text = 'a! a12';

      await widgetTester.enterText(input, text);
      await widgetTester.tap(button);

      expect(find.text('The input is not a word'), findsNothing);
    });
  });
}
