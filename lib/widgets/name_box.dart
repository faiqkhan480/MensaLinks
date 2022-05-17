import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mensa_links/widgets/title_text.dart';

import '../utils/colors.dart';
import '../utils/constants.dart';

class NameBox extends StatelessWidget {
  final String name;
  const NameBox({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(15)
      ),
      height: 50.0,
      width: 50.0,
      alignment: Alignment.center,
      child: TitleText(
        text: name,
        color: AppColors.white,
        weight: FontWeight.w700,
        size: Constants.heading20,
      ),
    );
  }
}
