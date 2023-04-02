import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_flutter_test/features/score/bloc/score_event.dart';
import 'package:otp_flutter_test/features/score/bloc/score_state.dart';
import 'package:otp_flutter_test/model/word_service.dart';

class ScoreBloc extends Bloc<ScoreEvent, ScoreState> {
  ScoreBloc(this._wordService) : super(ScoreState(0, [])) {
    on<ScoreEvent>(_mapEventToState);
  }

  final WordService _wordService;

  void _mapEventToState(ScoreEvent event, Emitter<ScoreState> emit) {
    if (event is LoadScore) {
      emit(
        ScoreState(
          _wordService.score,
          _wordService.words,
        ),
      );
    }
  }
}
