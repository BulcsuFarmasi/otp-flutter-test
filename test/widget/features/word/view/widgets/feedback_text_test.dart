import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:otp_flutter_test/features/word/bloc/word_bloc.dart';
import 'package:otp_flutter_test/features/word/bloc/word_event.dart';
import 'package:otp_flutter_test/features/word/view/widgets/feedback_text.dart';
import 'package:otp_flutter_test/model/word.dart';

class MockWordBlock extends MockBloc<WordEvent, List<Word>> implements WordBloc {}

void main() {
  group('FeedbackText', () {
    late List<Word> words;
    late WordBloc wordBloc;

    setUp(() {
      words = [
        Word('city', false),
        Word('village', true),
      ];

      wordBloc = MockWordBlock();
      when(() => wordBloc.state).thenReturn(words);
    });

    Widget createWidgetUnderTest() {
      return MaterialApp(
          home: Scaffold(
        body: BlocProvider.value(
          value: wordBloc,
          child: const FeedbackText(),
        ),
      ));
    }

    testWidgets('should display words', (WidgetTester widgetTester) async {
      await widgetTester.pumpWidget(createWidgetUnderTest());

      for (Word word in words) {
        expect(
            find.byWidgetPredicate(
                (Widget widget) => widget is RichText && widget.text.toPlainText().contains(word.text)),
            findsOneWidget);
      }
    });
  });
}
