
import 'package:flutter/material.dart';
import 'package:order_app/config/palette.dart';

class RoundeInput extends StatelessWidget {
  final double size;
  final String title;
  final IconData icon;
  final bool isPassWord;

  const RoundeInput({
    Key? key,
    required this.size,
    required this.icon,
    required this.title,
    this.isPassWord = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      width: size * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Palette.primaryColor.withAlpha(50),
      ),
      child: TextField(
        obscureText: isPassWord,
        cursorWidth: 1.5,
        cursorHeight: 20,
        cursorColor: Palette.primaryColor,
        decoration: InputDecoration(
          icon: Icon(icon, color: Palette.primaryColor),
          hintText: title,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
