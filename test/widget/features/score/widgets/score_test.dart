import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:otp_flutter_test/features/score/bloc/score_bloc.dart';
import 'package:otp_flutter_test/features/score/bloc/score_event.dart';
import 'package:otp_flutter_test/features/score/bloc/score_state.dart';
import 'package:otp_flutter_test/features/score/view/widgets/score.dart';
import 'package:otp_flutter_test/model/word.dart';

class MockScoreBlock extends MockBloc<ScoreEvent, ScoreState> implements ScoreBloc {}

void main() {
  group('Score', () {
    late ScoreBloc scoreBloc;

    setUp(() {
      scoreBloc = MockScoreBlock();
      when(() => scoreBloc.state).thenReturn(
        ScoreState(
          5,
          [
            Word('chair', true),
          ],
        ),
      );
    });

    Widget createWidgetUnderTest() {
      return MaterialApp(
        home: Scaffold(
          body: BlocProvider.value(
            value: scoreBloc,
            child: const Score(),
          ),
        ),
      );
    }

    testWidgets('should display score', (WidgetTester widgetTester) async {
      await widgetTester.pumpWidget(createWidgetUnderTest());

      final Finder score = find.text('5');

      expect(score, findsOneWidget);
    });
  });
}
