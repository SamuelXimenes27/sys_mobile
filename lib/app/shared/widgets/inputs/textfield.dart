import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.height,
    required this.width,
    required this.hintText,
    this.suffixIcon,
    this.onTap,
    this.controller,
  }) : super(key: key);

  final String? hintText;
  final double? height;
  final double? width;
  final suffixIcon;
  final Function()? onTap;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        onTap: onTap,
        controller: controller,
        decoration: InputDecoration(
          errorStyle: const TextStyle(height: 0.5),
          contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          border: const OutlineInputBorder(),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          suffixIcon: suffixIcon,
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "Esse campo não pode estar vazio!";
          }
          return null;
        },
      ),
    );
  }
}
