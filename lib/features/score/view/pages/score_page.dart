import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:otp_flutter_test/features/score/bloc/score_bloc.dart';
import 'package:otp_flutter_test/features/score/view/widgets/score_container.dart';
import 'package:otp_flutter_test/model/word_service.dart';
import 'package:otp_flutter_test/shared/app_drawer.dart';

class ScorePage extends StatefulWidget {
  const ScorePage({super.key});

  static const routeName = '/score';

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const AppDrawer(),
      body: BlocProvider<ScoreBloc>(
        create: (_) => ScoreBloc(GetIt.I.get<WordService>()),
        child: const ScoreContainer(),
      ),
    );
  }
}
