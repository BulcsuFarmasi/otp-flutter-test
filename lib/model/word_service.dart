import 'package:otp_flutter_test/model/word.dart';

class WordService {
  List<Word> _words = [];

  List<Word> get words => _words;

  void addWord(String wordText) {
    final Word word = Word(wordText, true);
    _words = [..._words, word];

    _highlightSameWords(wordText);
  }

  void _highlightSameWords(String wordText) {
    for (Word word in _words) {
      word.highlighted = word.text == wordText;
    }
  }
}
