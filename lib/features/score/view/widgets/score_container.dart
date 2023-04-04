import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_flutter_test/features/score/bloc/score_bloc.dart';
import 'package:otp_flutter_test/features/score/bloc/score_event.dart';
import 'package:otp_flutter_test/features/score/view/widgets/score.dart';
import 'package:otp_flutter_test/features/score/view/widgets/word_list.dart';

class ScoreContainer extends StatefulWidget {
  const ScoreContainer({
    super.key,
  });

  @override
  State<ScoreContainer> createState() => _ScoreContainerState();
}

class _ScoreContainerState extends State<ScoreContainer> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    BlocProvider.of<ScoreBloc>(context).add(LoadScore());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: const [
          Score(),
          Expanded(child: WordList()),
        ],
      ),
    );
  }
}
