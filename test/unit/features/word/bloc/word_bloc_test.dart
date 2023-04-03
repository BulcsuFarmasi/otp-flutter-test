import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:otp_flutter_test/features/word/bloc/word_bloc.dart';
import 'package:otp_flutter_test/features/word/bloc/word_event.dart';
import 'package:otp_flutter_test/model/word.dart';
import 'package:otp_flutter_test/model/word_service.dart';

class MockWordService extends Mock implements WordService {}

void main() {
  group('WordBloc', () {
    late WordService wordService;
    late WordBloc wordBloc;
    final List<Word> words = [Word('remote', true)];
    Word addedWord = Word('window', true);

    setUp(() {
      wordService = MockWordService();
      wordBloc = WordBloc(wordService);
    });

    blocTest(
      'should emit with added word',
      build: () => wordBloc,
      setUp: () {
        when(() => wordService.words).thenReturn(
          [
            Word('remote', false),
            Word('window', true),
          ],
        );
      },
      act: (bloc) => bloc.add(WordAdded(addedWord.text)),
      expect: () => [
        [
          Word('remote', false),
          Word('window', true),
        ],
      ],
    );
    blocTest(
      'should emit word got form service',
      build: () => wordBloc,
      setUp: () {
        when(() => wordService.words).thenReturn(
          [
            Word('remote', false),
            Word('window', true),
          ],
        );
      },
      act: (bloc) => bloc.add(LoadWord()),
      expect: () => [
        [
          Word('remote', false),
          Word('window', true),
        ],
      ],
    );
  });
}
