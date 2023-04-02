import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_flutter_test/features/word/bloc/word_bloc.dart';
import 'package:otp_flutter_test/features/word/bloc/word_event.dart';

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

    BlocProvider.of<WordBloc>(context, listen: false).add(WordAdded(_word!));

    setState(() {
      _word = '';
    });
  }

  String? _validateWord(String? word) {
    String? message;

    if (word == null || word.isEmpty) {
      return 'Please provide a word';
    }

    final RegExp regExp = RegExp(r'^[a-zA-Z]+$');

    if (!regExp.hasMatch(word)) {
      message = 'The input is not word';
    }

    const String limitWord = 'pneumonoultramicroscopicsilicovolcanoconiosis';

    if (word.length > limitWord.length) {
      message = 'The word is too long';
    }

    return message;
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
