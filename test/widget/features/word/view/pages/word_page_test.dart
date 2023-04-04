import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:otp_flutter_test/features/word/bloc/word_bloc.dart';
import 'package:otp_flutter_test/features/word/view/pages/word_page.dart';
import 'package:otp_flutter_test/features/word/view/widgets/feedback_text.dart';
import 'package:otp_flutter_test/features/word/view/widgets/word_form.dart';
import 'package:otp_flutter_test/model/word_service.dart';

void main() {
  group('WordPage', () {
    setUpAll(() {
      GetIt.I.registerSingleton(WordService());
    });

    Widget createWidgetUnderTest() {
      return const MaterialApp(home: WordPage());
    }

    testWidgets('should contain appDrawer', (WidgetTester widgetTester) async {
      await widgetTester.pumpWidget(createWidgetUnderTest());

      final Finder appDrawer = find.byType(AppBar);

      expect(appDrawer, findsOneWidget);
    });
    testWidgets('should contain blocProvider', (WidgetTester widgetTester) async {
      await widgetTester.pumpWidget(createWidgetUnderTest());

      final Finder blocProvider = find.byType(BlocProvider<WordBloc>);

      expect(blocProvider, findsOneWidget);
    });
    testWidgets('should contain wordForm', (WidgetTester widgetTester) async {
      await widgetTester.pumpWidget(createWidgetUnderTest());

      final Finder wordForm = find.byType(WordForm);

      expect(wordForm, findsOneWidget);
    });
    testWidgets('should contain feedbackText', (WidgetTester widgetTester) async {
      await widgetTester.pumpWidget(createWidgetUnderTest());

      final Finder feedbackTest = find.byType(FeedbackText);

      expect(feedbackTest, findsOneWidget);
    });
  });
}
