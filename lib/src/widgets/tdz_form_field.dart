import 'package:flutter/material.dart';
import 'package:to_do_zen/src/constants/colors.dart';

class TDZFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool isTextObscure;
  final bool isFocused;
  final String hintText;
  final IconData prefixIcon;
  final bool? hasSuffix;
  final IconData? suffixIcon;
  final Color? suffixColor;
  final TextInputType keyboardType;
  final Function()? onIconClicked;
  final Function()? onTap;
  final Function(String)? onChanged;

  final FormFieldValidator<String>? validate;

  const TDZFormField({
    required this.controller,
    required this.isTextObscure,
    required this.isFocused,
    required this.hintText,
    required this.prefixIcon,
    this.hasSuffix,
    this.suffixIcon,
    this.suffixColor,
    this.onTap,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.onIconClicked,
    this.validate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validate,
      style: const TextStyle(color: COLOR_DARK_ALT),
      onChanged: onChanged,
      onTap: onTap,
      obscureText: isTextObscure,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          prefixIcon: Icon(
            prefixIcon,
            color: isFocused
                ? COLOR_PRIMARY.withOpacity(0.6)
                : Colors.grey.withOpacity(0.8),
          ),
          hintText: hintText,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          hintStyle: TextStyle(
            color: isFocused
                ? COLOR_PRIMARY.withOpacity(0.6)
                : Colors.grey.withOpacity(0.8),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: COLOR_PRIMARY),
            borderRadius: BorderRadius.circular(5),
          ),
          suffixIcon: hasSuffix != null
              ? IconButton(
                  icon: Icon(
                    suffixIcon,
                    color: suffixColor,
                  ),
                  onPressed: onIconClicked,
                )
              : null,
          filled: true,
          fillColor: isFocused ? Colors.transparent : COLOR_LIGHT),
    );
  }
}
