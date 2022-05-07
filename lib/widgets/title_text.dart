import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TitleText extends StatelessWidget {
  final String text;
  final FontWeight? weight;
  final Color? color;
  final TextAlign? align;
  final num? size;

  const TitleText({
    Key? key,
    required this.text,
    this.weight,
    this.color,
    this.align,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.tr,
      textAlign: align,
      style: TextStyle(
        fontWeight: weight,
        color: color,
        fontSize: size?.toDouble(),
      ),
    );
  }
}
