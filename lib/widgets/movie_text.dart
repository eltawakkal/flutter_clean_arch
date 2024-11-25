import 'package:flutter/material.dart';

class MovieText extends StatelessWidget {
  final String text;
  final FontWeight? weight;
  final Color? color;
  final double? size;
  final int? maxLines;

  const MovieText({super.key, required this.text, this.weight, this.color, this.size, this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Text(text, maxLines: maxLines ?? 2, style: TextStyle(
      color: color ?? Colors.black87,
      fontSize: size ?? 14,
      height: 0,
      fontWeight: weight ?? FontWeight.normal
    ));
  }
}