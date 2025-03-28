import 'package:flutter/material.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  const CustomTextFormFieldWidget({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.suffixOnPressed,
    required this.controller,
  });

  final String hintText;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final bool? obscureText;
  final Function()? suffixOnPressed;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => value!.isEmpty ? "Required Field" : null,
      controller: controller,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        hintText: hintText,
        prefixIcon: Icon(prefixIcon),

        suffixIcon:
            suffixIcon != null
                ? IconButton(onPressed: suffixOnPressed, icon: Icon(suffixIcon))
                : null,
      ),
    );
  }
}
