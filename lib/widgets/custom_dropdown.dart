import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mensa_links/utils/assets.dart';
import 'package:mensa_links/utils/colors.dart';
import 'package:mensa_links/utils/constants.dart';
import 'package:mensa_links/widgets/text_widgets.dart';

import '../utils/screen_properties.dart';

class CustomDropdown extends StatelessWidget {
  final List<String> values;
  final Function(String?) onValueSelected;
  final String? label;
  final String? hint, selectedValue;
  final double? width;
  final bool? filled;

  const CustomDropdown({
    Key? key,
    this.label,
    required this.onValueSelected,
    this.width,
    required this.values,
    this.selectedValue,
    this.hint,
    this.filled
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: label != null ? 10 : 0,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(label != null)
            TitleText(
            text: label!,
            color: AppColors.primaryColor.withOpacity(0.5),
            weight: FontWeight.bold,
            size: Constants.heading18,
          ),
          DropdownButtonFormField(
              value: selectedValue,
              items: values.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: TitleText(
                text: hint ?? '',
                weight: FontWeight.w700,
                color: filled != null && filled! ? AppColors.primaryColor : AppColors.darkGrey,
              ),
              decoration: InputDecoration(
                filled: filled,
                fillColor: AppColors.ultraDarkGrey,
                border: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(Constants.textFieldRadius)),
                    borderSide: const BorderSide(color: AppColors.primaryColor, width: 1.0)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(Constants.textFieldRadius)),
                    borderSide: const BorderSide(color: AppColors.primaryColor, width: 1.0)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(Constants.textFieldRadius)),
                    borderSide: const BorderSide(color: Colors.red, width: 1.0)),
                contentPadding: const EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
                // labelText: widget.title,
              ),
              icon: RotatedBox(
                  quarterTurns: 2,
                  child: SvgPicture.asset(Assets.upArrow, height: 15, color: AppColors.primaryColor)),
              onChanged: onValueSelected
          )
        ],
      ),
    );
  }
}

class DropdownMenuField extends StatelessWidget {
  final List<String> values;
  final String value;
  const DropdownMenuField({Key? key, required this.values, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryColor, width: 1.0),
        borderRadius: BorderRadius.circular(Constants.textFieldRadius),
      ),
      // padding: UIStyleProperties.leftInset10,
      height: Get.height * 0.058,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Expanded(
            child: Center(
              child: TitleText(
                text: value,
                color: AppColors.primaryColor,
                weight: FontWeight.w700,
              ),
            ),
          ),
          const VerticalDivider(color: AppColors.primaryColor, thickness: 1.0, width: 1),
          PopupMenuButton(
            padding: EdgeInsets.zero,
              onSelected: (item) {},
              icon: RotatedBox(
                  quarterTurns: 2,
                  child: SvgPicture.asset(Assets.upArrow, height: 15, color: AppColors.primaryColor)),
                  itemBuilder: (BuildContext context) => List<PopupMenuEntry>.generate(values.length,
                  (index) =>  PopupMenuItem(value: values.elementAt(index),
                    child: Text(values.elementAt(index)),
                  ),),
          )
        ],
      ),
    );
  }
}

