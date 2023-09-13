import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
        required this.controller,
        this.keyboard,
        required this.validate,
        this.onSubmit,
        this.onchange,
        this.onTap,
        this.label,
        this.isClickable = true,
         this.prefixIcon,
        this.suffixPressed,
        this.suffixIcon,
        this.isPassword = false,
        this.colorIcon,
        this.labelStyle,
        this.enabledBorder,
        this.focusedBorder,
        this.hintText,
      this.maxLines
      });

  final TextEditingController controller;
  final TextInputType? keyboard;
  final String? Function(String?)? validate;
  final void Function(String)? onSubmit;
  final void Function(String)? onchange;
  final void Function()? onTap;
  final String? label;
  final bool isClickable;

  final dynamic prefixIcon;
  final void Function()? suffixPressed;
  final dynamic suffixIcon;
  final bool isPassword;

  final Color? colorIcon;
  final TextStyle? labelStyle;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final String? hintText;
  final int? maxLines;

  // Color? colorBorder;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboard,
      obscureText: isPassword,
      maxLines: maxLines,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onchange,
      onTap: onTap,
      cursorColor: Colors.teal,
      validator: validate,
      decoration: InputDecoration(
        hintText: hintText,
        labelStyle: labelStyle,
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        labelText: label,
        // prefixIcon: Icon(
        //   prefixIcon,
        //   color: colorIcon,
        // ),
        // suffixIcon: IconButton(
        //   icon: Icon(suffixIcon),
        //   onPressed: suffixPressed,
        // ),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
