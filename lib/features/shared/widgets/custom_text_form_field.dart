import 'package:flutter/material.dart';
import 'package:app_cafe/config/theme/app_theme.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final Icon? suffixIcon;

  const CustomTextFormField(
      {super.key,
      this.label,
      this.onFieldSubmitted,
      this.onChanged,
      this.keyboardType,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppTheme().getTheme().colorScheme;
    final labelTextStyle = TextStyle(fontSize: 15, color: colorScheme.primary);

    final boxDecoration = BoxDecoration(
        color: colorScheme.background,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
              color: Color.fromARGB(255, 243, 219, 219),
              blurRadius: 3.0,
              offset: Offset(0.0, 9.75)),
        ]);

    final textFormDecoration = InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: colorScheme.primary, width: 2.0),
        ),
        filled: true,
        floatingLabelStyle: TextStyle(color: colorScheme.primary),
        labelText: (label != null) ? label : null,
        labelStyle: labelTextStyle,
        suffixIcon: suffixIcon);

    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: boxDecoration,
      child: TextFormField(
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
        decoration: textFormDecoration,
        keyboardType: keyboardType,
      ),
    );
  }
}
