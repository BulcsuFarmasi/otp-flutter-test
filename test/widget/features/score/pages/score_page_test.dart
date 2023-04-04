import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:otp_flutter_test/features/score/bloc/score_bloc.dart';
import 'package:otp_flutter_test/features/score/view/pages/score_page.dart';
import 'package:otp_flutter_test/features/score/view/widgets/score_container.dart';
import 'package:otp_flutter_test/model/word_service.dart';

void main() {
  group('ScorePage', () {
    setUpAll(() {
      GetIt.I.registerSingleton(WordService());
    });

    Widget createWidgetUnderTest() {
      return const MaterialApp(
        home: ScorePage(),
      );
    }

    testWidgets('should contain appDrawer', (WidgetTester widgetTester) async {
      await widgetTester.pumpWidget(createWidgetUnderTest());

      final Finder appDrawer = find.byType(AppBar);

      expect(appDrawer, findsOneWidget);
    });

    testWidgets('should contain scoreContainer', (WidgetTester widgetTester) async {
      await widgetTester.pumpWidget(createWidgetUnderTest());

      final Finder scoreContainer = find.byType(ScoreContainer);

      expect(scoreContainer, findsOneWidget);
    });

    testWidgets('should contain blocProvider', (WidgetTester widgetTester) async {
      await widgetTester.pumpWidget(createWidgetUnderTest());

      final Finder blocProvider = find.byType(BlocProvider<ScoreBloc>);

      expect(blocProvider, findsOneWidget);
    });
  });
}
