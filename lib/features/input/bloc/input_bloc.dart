import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_flutter_test/features/input/bloc/input_event.dart';
import 'package:otp_flutter_test/model/word.dart';
import 'package:otp_flutter_test/model/word_service.dart';

class InputBloc extends Bloc<InputEvent, List<Word>> {
  InputBloc(this._wordService) : super([]) {
    on<InputEvent>(_mapEventToState);
  }

  final WordService _wordService;

  void _mapEventToState(InputEvent event, Emitter<List<Word>> emit) {
    if (event is InputWordAdded) {
      _wordService.addWord(event.word);

      emit(_wordService.words);
    }
  }
}
