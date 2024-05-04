import 'package:flutter/material.dart';

import '../values/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.textInputAction = TextInputAction.done,
    this.textInputType = TextInputType.text,
    required this.hintText,
    this.obscureText = false,
    this.suffixOnPress = defaultAction,
    this.onChanged = defaultOnChangeAction,
    this.isSuffix = false,
  });

  final TextInputAction? textInputAction;
  final TextInputType textInputType;
  final String hintText;
  final bool obscureText;
  final VoidCallback suffixOnPress;
  final Function(String) onChanged;
  final bool isSuffix;

  static void defaultAction() {}
  static void defaultOnChangeAction(String value) {}

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      autofocus: false,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: hintText,
        labelStyle: TextStyle(
          color: Colors.grey[800],
          fontSize: 16,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.textGrey,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryGreen,
            width: 2.0,
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.textGrey,
            width: 2.0,
          ),
        ),
        suffixIcon: !isSuffix
            ? const Icon(
                Icons.abc,
                color: Colors.transparent,
              )
            : IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey, // Customize the icon color as needed
                ),
                onPressed: suffixOnPress,
              ),
      ),
    );
  }
}
