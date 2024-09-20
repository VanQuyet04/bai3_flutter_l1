import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool obscureText;

  const CustomInputField({super.key, required this.controller, required this.hint, this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        border: const OutlineInputBorder(),
      ),
      obscureText: obscureText,
    );
  }
}

void showCustomSnackBar(BuildContext context, String message,Color color) {
  final snackBar = SnackBar(
    content: Text(message),
    duration: const Duration(seconds: 3),
    backgroundColor: color,
    action: SnackBarAction(
      label: 'OK',
      onPressed: () {

      },
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
