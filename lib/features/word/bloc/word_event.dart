abstract class WordEvent {}

class WordAdded extends WordEvent {
  final String word;

  WordAdded(this.word);
}

class LoadWord extends WordEvent {}
