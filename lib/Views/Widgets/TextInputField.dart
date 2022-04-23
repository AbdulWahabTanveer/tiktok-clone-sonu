import 'package:flutter/material.dart';

import '../../Constants.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final bool isObscure;
  final IconData icon;
  final String labelText;

  const TextInputField(
      {Key? key,
      required this.controller,
      this.isObscure = false,
      required this.icon,
      required this.labelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isObscure,
      cursorColor: borderColor,
      decoration: InputDecoration(
        prefixIcon: Icon(icon,color: borderColor,),
        focusColor: borderColor,
        label: Text(labelText),
        labelStyle: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.w400, color: borderColor),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: borderColor),
        ),
      ),
    );
  }
}
