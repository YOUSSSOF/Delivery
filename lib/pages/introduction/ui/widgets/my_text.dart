import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/dimesions.dart';

class MyText extends StatelessWidget {
  const MyText({
    Key? key,
    required this.text,
    this.color = Colors.black,
    this.size = 0,
    this.weight = FontWeight.w400,
    this.textOverflow,
    this.lineHeight,
    this.align = TextAlign.center,
    this.wordSpacing,
    this.maxLines,
  }) : super(key: key);
  final String text;
  final Color color;
  final double size;
  final FontWeight weight;
  final TextOverflow? textOverflow;
  final double? lineHeight;
  final TextAlign align;
  final double? wordSpacing;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: textOverflow,
      textAlign: align,
      style: TextStyle(
        fontSize: size == 0 ? Dimensions.size16 : size,
        fontWeight: weight,
        color: color,
        height: lineHeight,
        wordSpacing: wordSpacing,
      ),
      maxLines: maxLines,
    );
  }
}
