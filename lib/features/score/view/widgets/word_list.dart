import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_flutter_test/features/score/bloc/score_bloc.dart';
import 'package:otp_flutter_test/features/score/bloc/score_state.dart';
import 'package:otp_flutter_test/model/word.dart';

class WordList extends StatelessWidget {
  const WordList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScoreBloc, ScoreState>(
      builder: (_, ScoreState state) {
        return ListView(
          children: state.words
              .map((Word word) => ListTile(
                    title: Text(word.text),
                    trailing: Text('${word.score}'),
                  ))
              .toList(),
        );
      },
    );
  }
}
