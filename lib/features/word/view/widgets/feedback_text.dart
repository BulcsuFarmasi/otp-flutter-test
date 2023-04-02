import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_flutter_test/features/word/bloc/word_bloc.dart';
import 'package:otp_flutter_test/features/word/bloc/word_event.dart';
import 'package:otp_flutter_test/model/word.dart';

class FeedbackText extends StatefulWidget {
  const FeedbackText({super.key});

  @override
  State<FeedbackText> createState() => _FeedbackTextState();
}

class _FeedbackTextState extends State<FeedbackText> {
  bool wordLoaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!wordLoaded) {
      BlocProvider.of<WordBloc>(context).add(LoadWord());
    }
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle boldText = TextStyle(fontWeight: FontWeight.bold);
    return BlocBuilder<WordBloc, List<Word>>(builder: (_, List<Word> words) {
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
