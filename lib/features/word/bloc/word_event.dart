abstract class WordEvent {}

class WordAdded extends WordEvent {
  final String word;

  WordAdded(this.word);

  @override
  int get hashCode => word.hashCode;

  @override
  bool operator ==(Object other) {
    return other is WordAdded && other.hashCode == hashCode;
  }
}

class LoadWord extends WordEvent {}
