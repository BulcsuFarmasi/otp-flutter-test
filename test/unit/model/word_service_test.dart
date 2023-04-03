import 'package:flutter_test/flutter_test.dart';
import 'package:otp_flutter_test/model/word.dart';
import 'package:otp_flutter_test/model/word_service.dart';

void main() {
  group('WordService  ', () {
    late WordService wordService;

    setUp(() {
      wordService = WordService();
    });

    test('should set initial values correctly', () {
      expect(wordService.words, []);
      expect(wordService.score, 0);
    });
    group('addWord', () {
      test('should add word to words', () {
        wordService.addWord('headphone');

        expect(
          wordService.words,
          [
            Word(
              'headphone',
              true,
            ),
          ],
        );
      });
      test('should highlight approprate words', () {
        wordService.addWord('headphone');
        wordService.addWord('curtain');

        expect(
          wordService.words,
          [
            Word(
              'headphone',
              false,
            ),
            Word(
              'curtain',
              true,
            ),
          ],
        );
      });
      test('should calculate score correctly', () {
        wordService.addWord('headphone');
        wordService.addWord('curtain');

        expect(wordService.score, 16);
      });
    });
  });
}
