import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({
    Key? key,
    this.valueSelected,
    required this.onChanged,
    required this.onSaved,
    required this.dropdownValue,
    this.height,
    required this.width,
  }) : super(key: key);

  final String? valueSelected;
  final Function(Object?)? onChanged;
  final Function(Object?)? onSaved;
  final List<String> dropdownValue;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: DropdownButtonFormField(
        style: const TextStyle(color: Colors.grey, fontSize: 14),
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
        ),
        value: valueSelected,
        onChanged: onChanged,
        onSaved: onSaved,
        items: dropdownValue.map((String val) {
          return DropdownMenuItem(
              value: val,
              child: Text(
                val,
              ));
        }).toList(),
        icon: const Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Icon(Icons.keyboard_arrow_down_outlined),
        ),
      ),
    );
  }
}
