import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  const TextForm({super.key, required this.textController, required this.hintText});
  final TextEditingController textController;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: textController,
        autofocus: false,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          hintText: 'e-mail',
          prefixIcon: const Icon(Icons.email),
        ));
  }
}
