import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:otp_flutter_test/features/score/bloc/score_bloc.dart';
import 'package:otp_flutter_test/features/score/bloc/score_event.dart';
import 'package:otp_flutter_test/features/score/bloc/score_state.dart';
import 'package:otp_flutter_test/features/score/view/widgets/score.dart';
import 'package:otp_flutter_test/features/score/view/widgets/score_container.dart';

class MockScoreBloc extends MockBloc<ScoreEvent, ScoreState> implements ScoreBloc {}

void main() {
  group('ScoreContainer', () {
    late ScoreBloc scoreBloc;

    setUp(() {
      scoreBloc = MockScoreBloc();
      when(() => scoreBloc.add(const LoadScore())).thenReturn(null);
      when(() => scoreBloc.state).thenReturn(ScoreState(0, []));
    });

    Widget createWidgetUnderTest() {
      return MaterialApp(
        home: Scaffold(
          body: BlocProvider.value(
            value: scoreBloc,
            child: const ScoreContainer(),
          ),
        ),
      );
    }

    testWidgets('should call bloc add', (WidgetTester widgetTester) async {
      await widgetTester.pumpWidget(createWidgetUnderTest());

      verify(
        () => scoreBloc.add(
          const LoadScore(),
        ),
      );
    });

    testWidgets('should contain score', (WidgetTester widgetTester) async {
      await widgetTester.pumpWidget(createWidgetUnderTest());

      final Finder score = find.byType(Score);

      expect(score, findsOneWidget);
    });

    testWidgets('should contain word list', (WidgetTester widgetTester) async {
      await widgetTester.pumpWidget(createWidgetUnderTest());

      final Finder score = find.byType(Score);

      expect(score, findsOneWidget);
    });
  });
}
