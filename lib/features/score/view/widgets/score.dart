import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_flutter_test/features/score/bloc/score_bloc.dart';
import 'package:otp_flutter_test/features/score/bloc/score_state.dart';

class Score extends StatelessWidget {
  const Score({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScoreBloc, ScoreState>(builder: (_, ScoreState state) {
      return Text(
        '${state.score}',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineSmall,
      );
    });
  }
}
