import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final double customWidth;
  final String hintText;
  bool obscureText;

  CustomFormField({
    super.key,
    required this.obscureText,
    required this.customWidth,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: customWidth,
      child: TextFormField(
        cursorColor: Colors.white,
        autocorrect: false,
        obscureText: obscureText,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white70),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
