import 'package:otp_flutter_test/model/word.dart';

class ScoreState {
  ScoreState(this.score, this.words);

  final int score;
  final List<Word> words;

  @override
  int get hashCode => score.hashCode ^ words.hashCode;

  @override
  bool operator ==(Object other) {
    return other is ScoreState && other.hashCode == hashCode;
  }
}
