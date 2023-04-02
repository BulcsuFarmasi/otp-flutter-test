import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:otp_flutter_test/features/word/bloc/word_bloc.dart';
import 'package:otp_flutter_test/features/word/view/widgets/feedback_text.dart';
import 'package:otp_flutter_test/features/word/view/widgets/word_form.dart';
import 'package:otp_flutter_test/model/word_service.dart';
import 'package:otp_flutter_test/shared/app_drawer.dart';

class WordPage extends StatelessWidget {
  const WordPage({super.key});

  static const routeName = '/input';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        drawer: const AppDrawer(),
        body: BlocProvider(
          create: (_) => WordBloc(GetIt.I<WordService>()),
          child: Column(
            children: const [
              WordForm(),
              FeedbackText(),
            ],
          ),
        ));
  }
}
