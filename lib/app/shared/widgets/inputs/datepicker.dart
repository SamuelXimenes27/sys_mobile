import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({
    super.key,
    this.onPressed,
    this.height,
    this.width,
    this.onTap,
    this.controller,
    this.labelText,
  });

  final Function()? onPressed;
  final Function()? onTap;
  final double? width;
  final double? height;
  final TextEditingController? controller;
  final String? labelText;

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      widget.controller!.text = DateFormat.yMd().format(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextFormField(
        controller: widget.controller,
        onTap: () => _selectDate(context),
        decoration: InputDecoration(
          errorStyle: const TextStyle(height: 0.5),
          contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          border: const OutlineInputBorder(),
          hintText: widget.labelText,
          hintStyle: const TextStyle(color: Colors.grey),
          prefixIcon: const Icon(Icons.calendar_today),
        ),
        readOnly: true,
      ),
    );
  }
}
