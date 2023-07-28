import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import '../../../constants.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.imageIcon,
    required this.hintText,
    this.textType = TextInputType.text,
    this.obscure = false,
    this.errorText,
    this.onChange,
    required this.bottom,
    required this.controller,
  });

  final String imageIcon;
  final String hintText;
  final String? errorText;
  final Function(String)? onChange;
  final TextInputType? textType;
  final bool obscure;
  final double bottom;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20, left: 20, bottom: bottom),
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        keyboardType: textType,
        cursorHeight: 23,
        onChanged: onChange,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(20),
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Container(
            margin: EdgeInsetsDirectional.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Color(ColorManager.mainColor).withOpacity(0.10),
              borderRadius: BorderRadius.circular(10),
            ),
            height: 45,
            width: 48,
            child: Image.asset(
              imageIcon,
              scale: 1.8,
            ),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.black.withOpacity(0.5),
            fontSize: 12,
          ),
          errorText: errorText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
