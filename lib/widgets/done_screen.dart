import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../utils/assets.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';
import '../utils/screen_properties.dart';
import 'custom_button.dart';
import 'title_text.dart';

class DoneScreen extends StatelessWidget {
  final String message;
  const DoneScreen({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(Assets.linksLogo,),
          Container(
            decoration: UIStyleProperties.roundedRadiusDecoration(radius: 20),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Column(
              children: [
                const Icon(Icons.check_circle_rounded, size: 50, ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: TitleText(
                    text: message,
                    size: Constants.heading20,
                    weight: FontWeight.w700,
                    color: AppColors.primaryColor,
                    align: TextAlign.center,
                  ),
                ),
                CustomButton(
                  label: "ok",
                  alignment: Alignment.center,
                  minWidth: 0.30,
                  onTap: () => Get.back(),
                )
                // else
                //   const CustomAnimatedCheckMark(
                //     backgroundColor: AppColors.primaryColor,
                //     checkMarkColor: AppColors.backgroundColor,
                //   ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
