import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icone,
    this.onTap,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final icone;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 236,
      height: 65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color(0xff49BEB7),
      ),
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          title: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            subtitle,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          leading: Icon(
            icone,
            size: 50,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
