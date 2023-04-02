import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:otp_flutter_test/model/word_service.dart';

import 'shared/app.dart';

void main() {
  GetIt.I.registerSingleton(WordService());
  runApp(const App());
}
