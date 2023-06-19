import 'package:flutter/material.dart';

class TextSearch extends StatelessWidget {
  const TextSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: 'Input text',
      maxLength: 20,
      decoration: const InputDecoration(
        icon: Icon(Icons.favorite),
        labelText: 'Label text',
        labelStyle: TextStyle(
          color: Color(0xFF6200EE),
        ),
        helperText: 'Helper text',
        suffixIcon: Icon(
          Icons.check_circle,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF6200EE)),
        ),
      ),
    );
  }
}
