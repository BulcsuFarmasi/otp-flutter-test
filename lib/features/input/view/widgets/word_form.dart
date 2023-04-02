import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_flutter_test/features/input/bloc/input_bloc.dart';
import 'package:otp_flutter_test/features/input/bloc/input_event.dart';

class WordForm extends StatefulWidget {
  const WordForm({super.key});

  @override
  State<WordForm> createState() => _WordFormState();
}

class _WordFormState extends State<WordForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _word;

  void _saveWord(String? word) {
    setState(() {
      _word = word;
    });
  }

  void _submitWord() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();

    BlocProvider.of<InputBloc>(context, listen: false).add(InputWordAdded(_word!));
  }

  String? _validateWord(String? word) {
    const String message = 'The input is not word';

    if (word == null) {
      return message;
    }

    final RegExp regExp = RegExp(r'^[a-zA-Z]+$');
    return regExp.hasMatch(word) ? null : message;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            initialValue: _word,
            onSaved: _saveWord,
            validator: _validateWord,
          ),
          ElevatedButton(
            onPressed: _submitWord,
            child: const Text('Save Word'),
          )
        ],
      ),
    );
  }
}
