import 'package:flutter/material.dart';
import 'package:to_do_zen/src/utils/themes/outlined_button.dart';
import 'package:to_do_zen/src/utils/themes/text_form_field.dart';

class ToDoZenTheme {
  // prevent instantiation
  ToDoZenTheme._();

  static ThemeData appTheme = ThemeData(
    outlinedButtonTheme: ToDoZenOutlinedButtonTheme.outlinedButtonTheme,
    inputDecorationTheme: ToDoZenTextFormFieldTheme.inputDecorationTheme
  );
}
