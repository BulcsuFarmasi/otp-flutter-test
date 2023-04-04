import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:otp_flutter_test/features/score/view/pages/score_page.dart';
import 'package:otp_flutter_test/features/word/view/pages/word_page.dart';
import 'package:otp_flutter_test/model/word_service.dart';
import 'package:otp_flutter_test/shared/app_drawer.dart';

void main() {
  group('AppDrawer', () {
    setUpAll(() {
      GetIt.I.registerSingleton(WordService());
    });

    Widget createWidgetUnderTest() {
      return MaterialApp(
        home: const AppDrawer(),
        routes: {
          WordPage.routeName: (_) => const WordPage(),
          ScorePage.routeName: (_) => const ScorePage(),
        },
      );
    }

    group('tiles', () {
      testWidgets('should contain word list tile', (WidgetTester widgetTester) async {
        await widgetTester.pumpWidget(createWidgetUnderTest());

        final Finder wordListTile = find.descendant(of: find.byType(ListTile), matching: find.text('Word'));

        expect(wordListTile, findsOneWidget);
      });
      testWidgets('should contain score list tile', (WidgetTester widgetTester) async {
        await widgetTester.pumpWidget(createWidgetUnderTest());

        final Finder scoreListTile = find.descendant(of: find.byType(ListTile), matching: find.text('Score'));

        expect(scoreListTile, findsOneWidget);
      });
    });

    group('navigate', () {
      testWidgets('should navigate to word page', (WidgetTester widgetTester) async {
        await widgetTester.pumpWidget(createWidgetUnderTest());

        final Finder wordListTile = find.descendant(of: find.byType(ListTile), matching: find.text('Word'));

        await widgetTester.tap(wordListTile);
        await widgetTester.pumpAndSettle();

        final Finder wordPage = find.byType(WordPage);

        expect(wordPage, findsOneWidget);
      });
      testWidgets('should contain score list tile', (WidgetTester widgetTester) async {
        await widgetTester.pumpWidget(createWidgetUnderTest());

        final Finder scoreListTile = find.descendant(of: find.byType(ListTile), matching: find.text('Score'));

        await widgetTester.tap(scoreListTile);
        await widgetTester.pumpAndSettle();

        final Finder scorePage = find.byType(ScorePage);

        expect(scorePage, findsOneWidget);
      });
    });
  });
}
