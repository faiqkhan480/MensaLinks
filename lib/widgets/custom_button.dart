import 'package:flutter/material.dart';
import 'package:mensa_links/utils/constants.dart';
import 'package:mensa_links/utils/size_config.dart';
import 'package:mensa_links/widgets/title_text.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Function() onTap;
  final double? verticalMargin;
  const CustomButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.verticalMargin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: verticalMargin ?? 0,
      ),
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Constants.primaryColor,
          ),
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(
              10,
            ),
          ),
          minimumSize: MaterialStateProperty.all(
            Size(
              SizeConfig.screenWidth * 0.7,
              SizeConfig.screenHeight * 0.06,
            ),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                15,
              ),
            ),
          ),
        ),
        child: TitleText(
          text: label,
          weight: FontWeight.bold,
          size: Constants.buttonTextSize,
        ),
      ),
    );
  }
}
