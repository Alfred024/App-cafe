import 'package:flutter/material.dart';
import 'package:app_cafe/config/theme/app_theme.dart';

class CustomTextFormField extends StatelessWidget {
  final bool obscureText;
  final double? width;
  final double? height;
  final String? label;
  final String? hint;
  final String? errorMessage;
  final Icon? suffixIcon;
  final TextInputType keyboardType;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const CustomTextFormField(
      {super.key,
      this.label,
      this.onFieldSubmitted,
      this.onChanged,
      this.keyboardType = TextInputType.text,
      this.suffixIcon,
      this.obscureText = false,
      this.hint,
      this.width = double.infinity,
      this.height = 70,
      this.errorMessage,
      this.validator});

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppTheme().getTheme().colorScheme;
    final textThemes = AppTheme().getTheme().textTheme;
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
        errorText: errorMessage,
        errorStyle: textThemes.displaySmall,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: colorScheme.primary, width: 2.0),
        ),
        filled: true,
        floatingLabelStyle: TextStyle(color: colorScheme.primary),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelText: (label != null) ? label : null,
        labelStyle: labelTextStyle,
        suffixIcon: suffixIcon);

    return Container(
      width: width,
      height: height,
      clipBehavior: Clip.hardEdge,
      decoration: boxDecoration,
      child: TextFormField(
        obscureText: obscureText,
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
        decoration: textFormDecoration,
        keyboardType: keyboardType,
      ),
    );
  }
}
