import 'package:flutter/material.dart';
import 'package:to_do_zen/src/constants/colors.dart';

class AppFormField extends StatefulWidget {
  final TextEditingController controller;
  final bool isTextObscure;
  final bool isFilled;
  final String hintText;
  final IconData prefixIcon;
  final TextInputType keyboardType;
  final Function? onIconClicked;
  final FormFieldValidator<String>? validate;

  const AppFormField({
    required this.controller,
    required this.isTextObscure,
    required this.isFilled,
    required this.hintText,
    required this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.onIconClicked,
    this.validate,
    super.key,
  });

  @override
  State<AppFormField> createState() => _AppFormFieldState();
}

class _AppFormFieldState extends State<AppFormField> {
  final FocusNode _inputFocusNode = FocusNode();
  bool _obscureToggle = false;
  bool _isFocused = false;
  bool _isNotEmpty = false;

  @override
  void initState() {
    super.initState();
    _inputFocusNode.addListener(() {
      setState(() {
        _isFocused = _inputFocusNode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validate,
      focusNode: _inputFocusNode,
      style: const TextStyle(color: COLOR_DARK_ALT),
      onChanged: (value) {
        value.isNotEmpty
            ? setState(() {
                _isNotEmpty = true;
              })
            : setState(() {
                _isNotEmpty = false;
              });
      },
      obscureText: widget.isTextObscure,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
          prefixIcon: Icon(
            widget.prefixIcon,
            color: _isFocused
                ? COLOR_PRIMARY.withOpacity(0.6)
                : Colors.grey.withOpacity(0.8),
          ),
          hintText: widget.hintText,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          hintStyle: TextStyle(
            color: _isFocused
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
          suffixIcon: IconButton(
            icon: widget.isTextObscure
                ? const Icon(Icons.visibility)
                : const Icon(Icons.visibility_off),
            color: Colors.grey.withOpacity(0.8),
            onPressed: () {
              widget.isTextObscure
                  ? setState(() {
                      _obscureToggle = !_obscureToggle;
                    })
                  : null;
            },
          ),
          filled: true,
          fillColor: _isFocused ? Colors.transparent : COLOR_LIGHT),
    );
  }
}
