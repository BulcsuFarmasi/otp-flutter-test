import 'package:otp_flutter_test/model/word.dart';

class WordService {
  List<Word> _words = [];
  int _score = 0;

  List<Word> get words => _words;

  int get score => _score;

  void addWord(String wordText) {
    final Word word = Word(wordText, true);
    _words = [..._words, word];

    _highlightSameWords(wordText);
    _calculateScore();
  }

  void _calculateScore() {
    _score = _words.fold(0, (int previousScore, Word word) => word.score + previousScore);
  }

  void _highlightSameWords(String wordText) {
    for (Word word in _words) {
      word.highlighted = word.text == wordText;
    }
  }
}
