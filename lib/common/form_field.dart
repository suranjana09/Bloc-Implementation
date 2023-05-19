import 'package:flutter/material.dart';

class FormFieldWidgets extends StatelessWidget {
  final String hintText;
  final String labelText;
  final IconButton? suffixIcon;
  final Icon? prefixIcon;
  final bool visibleText;
  final TextEditingController? controller;
  final void Function(String value)? onChanged;
  final String? Function(String?)? validator;
  const FormFieldWidgets(
      {super.key,
      required this.hintText,
      this.suffixIcon,
      this.prefixIcon,
      required this.labelText,
      required this.visibleText,
      this.onChanged,
      this.validator,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: visibleText,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: hintText,
          hintStyle: const TextStyle(
              color: Color.fromARGB(255, 46, 45, 45), fontSize: 15),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          contentPadding: const EdgeInsets.only(top: 20, left: 10),
        ),
        onChanged: onChanged,
        validator: validator);
  }
}
