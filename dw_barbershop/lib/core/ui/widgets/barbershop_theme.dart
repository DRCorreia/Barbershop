import 'package:dw_barbershop/core/ui/constants.dart';
import 'package:flutter/material.dart';

sealed class BarbershopTheme {
  static const _defaultInput = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: ColorsConstants.grey));

  static ThemeData themeData = ThemeData(
      useMaterial3: true,
      inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          labelStyle: const TextStyle(color: ColorsConstants.grey),
          border: _defaultInput,
          enabledBorder: _defaultInput,
          focusedBorder: _defaultInput,
          errorBorder: _defaultInput.copyWith(
              borderSide: const BorderSide(color: ColorsConstants.red))),
              
          elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
            backgroundColor: ColorsConstants.brown,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            )
          )),
          fontFamily: FontConstants.fontFamily
          );
}
