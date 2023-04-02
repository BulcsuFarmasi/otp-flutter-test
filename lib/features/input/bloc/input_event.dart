abstract class InputEvent {}

class InputWordAdded extends InputEvent {
  final String word;

  InputWordAdded(this.word);
}
