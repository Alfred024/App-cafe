import 'package:flutter/material.dart';

class AppTheme {
  final colorLightAppScheme = const ColorScheme(
      brightness: Brightness.light,
      primary: Color.fromARGB(255, 252, 84, 84),
      onPrimary: Colors.white,
      secondary: Color.fromARGB(255, 255, 126, 126),
      onSecondary: Colors.white,
      error: Colors.redAccent,
      onError: Colors.yellow,
      background: Color.fromARGB(255, 255, 255, 255),
      onBackground: Colors.white,
      surface: Color.fromARGB(255, 247, 245, 245),
      onSurface: Colors.black);

  final appTextTheme = const TextTheme(
    //Títulos
    titleLarge: TextStyle(
        fontSize: 22, color: Colors.black, fontWeight: FontWeight.w500),
    titleMedium: TextStyle(
        fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500),
    titleSmall: TextStyle(
        fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),

    //Información de productos

    //el displaySmall lo estoy ocupando para mostrar errores
    displaySmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Color.fromARGB(255, 252, 84, 84),
    ),
    displayLarge: TextStyle(
        fontSize: 26,
        color: Color.fromARGB(255, 252, 84, 84),
        fontWeight: FontWeight.w600),

    //Texto en pantalla
    bodyMedium: TextStyle(
      fontSize: 16,
      color: Colors.black,
    ),
    bodySmall: TextStyle(
      fontSize: 16,
      color: Colors.white,
    ),

    //Etiquetas o testos breves
    labelSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    labelMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
  );

  final iconTheme = const IconThemeData(
    color: Color.fromARGB(255, 252, 84, 84),
  );

  final appFilledButtonTheme = const ButtonThemeData();
  final appOutlinedButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Color.fromARGB(255, 252, 84, 84))));

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorScheme: colorLightAppScheme,
        textTheme: appTextTheme,
        outlinedButtonTheme: appOutlinedButtonTheme,
        iconTheme: iconTheme,
      );
}
