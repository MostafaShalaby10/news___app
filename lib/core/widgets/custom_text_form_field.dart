import 'package:flutter/material.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  const CustomTextFormFieldWidget({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.suffixOnPressed,
    required this.controller, this.onChanged,
  });

  final String hintText;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final bool? obscureText;
  final Function()? suffixOnPressed;
  final TextEditingController controller;
  final Function(String)? onChanged;
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
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
