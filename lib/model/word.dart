class Word {
  Word(this.text, this.highlighted);

  final String text;
  bool highlighted;

  int get score => text.length;

  @override
  int get hashCode => text.hashCode ^ highlighted.hashCode;

  @override
  bool operator ==(Object other) {
    return other is Word && other.hashCode == hashCode;
  }
}
