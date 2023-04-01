class Word {
  Word(this.text, this.highlighted);

  final String text;
  bool highlighted;

  int get score => text.length;

}