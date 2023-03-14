import 'package:flutter/material.dart';

import '../../../shared/constants/colors_const.dart';

class ButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final String title;
  final double? height;
  final bool disable;

  const ButtonWidget({
    Key? key,
    required this.onPressed,
    required this.title,
    this.height,
    this.disable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: disable ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsConst.primary1,
        minimumSize: Size(
          double.infinity,
          height != null ? height! : MediaQuery.of(context).size.width * 0.15,
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          letterSpacing: 1.25,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
