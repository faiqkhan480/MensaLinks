import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mensa_links/utils/colors.dart';
import 'package:mensa_links/utils/constants.dart';
import 'package:mensa_links/widgets/title_text.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final double? verticalMargin, horizontalMargin, radius, fontSize, minWidth;
  final int? quarterTurns;
  final Alignment? alignment;
  final String? trailing;
  final EdgeInsets? padding;
  final bool invert;
  CustomButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.verticalMargin,
    this.horizontalMargin,
    this.alignment,
    this.trailing,
    this.quarterTurns,
    this.radius,
    this.minWidth,
    this.padding,
    this.fontSize,
    this.invert = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      margin: EdgeInsets.only(
        top: verticalMargin ?? 0,
        left: horizontalMargin ?? 0,
        right: horizontalMargin ?? 0
      ),
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            invert ? AppColors.white : AppColors.primaryColor,
          ),
          elevation: MaterialStateProperty.all(0),
          padding: MaterialStateProperty.all(padding ?? const EdgeInsets.all(10),),
          minimumSize: MaterialStateProperty.all(
            Size(
              Get.width * (minWidth ?? 0.7),
              Get.height * 0.06,
            ),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 15),
            ),
          ),
        ),
        child: trailing == null ?
        TitleText(
          text: label.tr,
          weight: FontWeight.bold,
          size: fontSize ?? Constants.buttonTextSize,
          color: invert ? AppColors.primaryColor : AppColors.white,
        ) :
        Row(
          mainAxisAlignment: trailing == null ? MainAxisAlignment.center : MainAxisAlignment.spaceBetween,
          children: [
            TitleText(
              text: label.tr,
              weight: FontWeight.bold,
              size: fontSize ?? Constants.buttonTextSize,
              color: invert ? AppColors.primaryColor : AppColors.white,
            ),

            if(trailing != null)
              // Image.asset(trailing!, scale: 2.0),
              RotatedBox(
                  quarterTurns: quarterTurns ?? 0,
                  child: SvgPicture.asset(trailing!, height: 15, color: AppColors.white)),
              // SvgPicture.asset(trailing!, color: Colors.white, height: 20,),
          ],
        ),
      ),
    );
  }
}
