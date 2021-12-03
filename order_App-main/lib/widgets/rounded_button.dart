// ignore_for_file: prefer_const_constructors


import 'package:flutter/material.dart';
import 'package:order_app/config/palette.dart';

class RoundedButton extends StatelessWidget {
  final double size;
  final String title;
  final Function onTap;
  const RoundedButton(
      {Key? key, required this.size, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap(),
      child: Container(
        width: size * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Palette.primaryColor,
        ),
        padding: EdgeInsets.symmetric(vertical: 18),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            color: Palette.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
