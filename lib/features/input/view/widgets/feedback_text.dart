import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_flutter_test/features/input/bloc/input_bloc.dart';
import 'package:otp_flutter_test/model/word.dart';

class FeedbackText extends StatelessWidget {
  const FeedbackText({super.key});

  @override
  Widget build(BuildContext context) {
    const TextStyle boldText = TextStyle(fontWeight: FontWeight.bold);
    return BlocBuilder<InputBloc, List<Word>>(builder: (_, List<Word> words) {
      return RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: words
              .map(
                (Word word) => TextSpan(text: '${word.text} ', style: word.highlighted ? boldText : null),
              )
              .toList(),
        ),
      );
    });
  }
}
