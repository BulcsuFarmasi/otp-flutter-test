import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:otp_flutter_test/features/word/bloc/word_bloc.dart';
import 'package:otp_flutter_test/features/word/view/widgets/word_form.dart';
import 'package:otp_flutter_test/model/word_service.dart';

void main() {
  group('WordForm', () {
    Widget createWidgetUnderTest() {
      return MaterialApp(
        home: Scaffold(
          body: BlocProvider(
            create: (_) => WordBloc(WordService()),
            child: const WordForm(),
          ),
        ),
      );
    }

    testWidgets('should not display any errors when a valid input is given and a button is pressed',
        (WidgetTester widgetTester) async {
      await widgetTester.pumpWidget(createWidgetUnderTest());
      final Finder input = find.byType(TextFormField);
      final Finder button = find.byType(ElevatedButton);

      const String text = 'apple';

      await widgetTester.enterText(input, text);
      await widgetTester.tap(button);

      expect(find.text('Please provide a word'), findsNothing);
      expect(find.text('Please only write letters'), findsNothing);
      expect(find.text('The word is not meaningful'), findsNothing);
      expect(find.text('The word is too long'), findsNothing);
    });

    testWidgets('should display provide a word error when an input is not given and a button is pressed',
        (WidgetTester widgetTester) async {
      await widgetTester.pumpWidget(createWidgetUnderTest());
      final Finder input = find.byType(TextFormField);
      final Finder button = find.byType(ElevatedButton);

      await widgetTester.tap(button);

      expect(find.text('Please provide a word'), findsNothing);
    });

    testWidgets(
        'should display only letters error when an input with not only letters is given and a button is pressed',
        (WidgetTester widgetTester) async {
      await widgetTester.pumpWidget(createWidgetUnderTest());
      final Finder input = find.byType(TextFormField);
      final Finder button = find.byType(ElevatedButton);

      const String text = 'a! a12';

      await widgetTester.enterText(input, text);
      await widgetTester.tap(button);

      expect(find.text('Please only write letters'), findsNothing);
    });

    testWidgets('should display meaningful word error when a not meaningful input is given and a button is pressed',
        (WidgetTester widgetTester) async {
      await widgetTester.pumpWidget(createWidgetUnderTest());
      final Finder input = find.byType(TextFormField);
      final Finder button = find.byType(ElevatedButton);

      const String text = 'abce';

      await widgetTester.enterText(input, text);
      await widgetTester.tap(button);

      expect(find.text('The word is not meaningful'), findsNothing);
    });

    testWidgets('should display word is too long error when a too long input is given and a button is pressed',
            (WidgetTester widgetTester) async {
          await widgetTester.pumpWidget(createWidgetUnderTest());
          final Finder input = find.byType(TextFormField);
          final Finder button = find.byType(ElevatedButton);

          const String text = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';

          await widgetTester.enterText(input, text);
          await widgetTester.tap(button);

          expect(find.text('The word is too long'), findsNothing);
        });
  });
}
