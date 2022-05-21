import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mensa_links/controller/home_controller.dart';
import 'package:mensa_links/widgets/text_widgets.dart';

import '../utils/colors.dart';
import '../utils/constants.dart';
import '../utils/screen_properties.dart';

class RadioButtons extends StatelessWidget {
  final HomeController controller;
  const RadioButtons({Key? key, required this.controller}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: UIStyleProperties.insetsVrt10,
      child: Obx(() => Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(Constants.tabs.length, (index) => radio(index < 1 ? 1 : 2)),
      )),
    );
  }

  Widget radio(int val) {
    return InkWell(
      onTap: () => controller.setRadioValue(val),
      radius: 20,
      child: Wrap(
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
                color: controller.radioSelection.value == val ? AppColors.primaryColor : Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.slightlyGrey, width: 1.8)
            ),
            margin: EdgeInsets.only(right: 2, left: (val + 5).toDouble()),
            height: Constants.heading18,
            width: Constants.heading18,
          ),
          TitleText(
            text: Constants.tabs.elementAt(val-1),
            color: AppColors.slightlyGrey,
            size: Constants.regularText,
            weight: FontWeight.bold,
          )
        ],
      ),
    );
  }
}
