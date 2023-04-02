import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_flutter_test/features/word/bloc/word_event.dart';
import 'package:otp_flutter_test/model/word.dart';
import 'package:otp_flutter_test/model/word_service.dart';

class WordBloc extends Bloc<WordEvent, List<Word>> {
  WordBloc(this._wordService) : super([]) {
    on<WordEvent>(_mapEventToState);
  }

  final WordService _wordService;

  void _mapEventToState(WordEvent event, Emitter<List<Word>> emit) {
    if (event is WordAdded) {
      _wordService.addWord(event.word);
      emit(_wordService.words);
    } else if (event is LoadWord) {
      emit(_wordService.words);
    }
  }
}
