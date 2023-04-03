import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:otp_flutter_test/features/score/bloc/score_bloc.dart';
import 'package:otp_flutter_test/features/score/bloc/score_event.dart';
import 'package:otp_flutter_test/features/score/bloc/score_state.dart';
import 'package:otp_flutter_test/model/word.dart';
import 'package:otp_flutter_test/model/word_service.dart';

class MockWordService extends Mock implements WordService {}

void main() {
  group('ScoreBloc', () {
    late ScoreBloc scoreBloc;
    late WordService wordService;
    final List<Word> words = [Word('apple', false), Word('boot', true)];
    const int score = 9;

    setUp(() {
      wordService = MockWordService();
      scoreBloc = ScoreBloc(wordService);
      when(() => wordService.words).thenReturn(words);
      when(() => wordService.score).thenReturn(score);
    });

    // blocTest(
    //   'should have initial values',
    //   build: () => scoreBloc,
    //   seed: () => ScoreState(
    //     0,
    //     [],
    //   ),
    //   expect: () => [
    //     ScoreState(
    //       0,
    //       [],
    //     ),
    //   ],
    // );
    blocTest(
      'should get values form service',
      build: () => scoreBloc,
      act: (bloc) => bloc.add(LoadScore()),
      expect: () => [
        ScoreState(score, words),
      ],
    );
  });
}
