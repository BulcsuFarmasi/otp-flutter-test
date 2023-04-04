import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:otp_flutter_test/features/score/bloc/score_bloc.dart';
import 'package:otp_flutter_test/features/score/bloc/score_event.dart';
import 'package:otp_flutter_test/features/score/bloc/score_state.dart';
import 'package:otp_flutter_test/features/score/view/widgets/word_list.dart';
import 'package:otp_flutter_test/model/word.dart';

class MockScoreBlock extends MockBloc<ScoreEvent, ScoreState> implements ScoreBloc {}

void main() {
  group('WordList',  () {
    late ScoreState scoreState;
    late ScoreBloc scoreBloc;

    setUp(() {
      scoreState = ScoreState(
        10,
        [
          Word('city', false),
          Word('village', true),
        ],
      );
      scoreBloc = MockScoreBlock();
      when(() => scoreBloc.state).thenReturn(scoreState);
    });

    Widget createWidgetUnderTest() {
      return MaterialApp(
          home: Scaffold(
        body: BlocProvider.value(
          value: scoreBloc,
          child: const WordList(),
        ),
      ));
    }

    testWidgets('should display words', (WidgetTester widgetTester) async {
      await widgetTester.pumpWidget(createWidgetUnderTest());

      for (Word word in scoreState.words) {
        final Finder text = find.descendant(of: find.byType(ListTile), matching: find.text(word.text));
        final Finder score = find.descendant(of: find.byType(ListTile), matching: find.text('${word.score}'));

        expect(text, findsOneWidget);
        expect(score, findsOneWidget);
      }
    });
  });
}
