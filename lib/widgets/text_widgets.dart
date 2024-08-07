import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';
import '../utils/constants.dart';
import '../utils/screen_properties.dart';

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
        color: color ?? AppColors.primaryColor,
        fontSize: size?.toDouble(),
      ),
    );
  }
}

class ScreenTitle extends StatelessWidget {
  final String text;
  final double? size;
  const ScreenTitle({Key? key, required this.text, this.size}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.tr,
      // softWrap: false,
      // overflow: TextOverflow.visible,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: AppColors.primaryColor,
        fontSize: size ?? Constants.subHeading,
        // fontSize: Get.textScaleFactor * 20.0,
        // fontSize: size.maxWidth * 0.055,
      ),
    );
  }
}

class SeparatorText extends StatelessWidget {
  final String text;
  final bool isDense;
  const SeparatorText(this.text, {Key? key, this.isDense = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: UIStyleProperties.insetsVrt20,
      child: ScreenTitle(text: text, size: isDense ? Constants.heading18 : Constants.heading20),
    );
  }
}

