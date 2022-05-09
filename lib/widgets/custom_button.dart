import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mensa_links/utils/colors.dart';
import 'package:mensa_links/utils/constants.dart';
import 'package:mensa_links/utils/size_config.dart';
import 'package:mensa_links/widgets/title_text.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final double? verticalMargin, radius;
  final Alignment? alignment;
  final String? trailing;
  final EdgeInsets? padding;
  CustomButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.verticalMargin,
    this.alignment,
    this.trailing,
    this.radius,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      margin: EdgeInsets.only(
        top: verticalMargin ?? 0,
      ),
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            AppColors.primaryColor,
          ),
          padding: MaterialStateProperty.all(padding ?? const EdgeInsets.all(10),),
          minimumSize: MaterialStateProperty.all(
            Size(
              SizeConfig.screenWidth * 0.7,
              SizeConfig.screenHeight * 0.06,
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
          size: Constants.buttonTextSize,
        ) :
        Row(
          mainAxisAlignment: trailing == null ? MainAxisAlignment.center : MainAxisAlignment.spaceBetween,
          children: [
            TitleText(
              text: label.tr,
              weight: FontWeight.bold,
              size: Constants.buttonTextSize,
            ),

            if(trailing != null)
              Image.asset(trailing!, scale: 2.0),
          ],
        ),
      ),
    );
  }
}
