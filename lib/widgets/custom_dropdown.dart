import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mensa_links/utils/assets.dart';
import 'package:mensa_links/utils/colors.dart';
import 'package:mensa_links/utils/constants.dart';
import 'package:mensa_links/widgets/title_text.dart';

import '../utils/screen_properties.dart';

class CustomDropdown extends StatelessWidget {
  final List<String> values;
  final Function(String?) onValueSelected;
  final String? label;
  final String? hint, selectedValue;
  final double width;

  const CustomDropdown({
    Key? key,
    this.label,
    required this.onValueSelected,
    required this.width,
    required this.values,
    this.selectedValue,
    this.hint,
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
                weight: FontWeight.w500,
                color: AppColors.ultraDarkGrey,
              ),
              decoration: const InputDecoration(
                fillColor: Colors.white,
                border: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: AppColors.primaryColor, width: 1.0)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: AppColors.primaryColor, width: 1.0)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.red, width: 1.0)),
                filled: true,
                contentPadding: EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
                // labelText: widget.title,
              ),
              icon: RotatedBox(
                  quarterTurns: 2,
                  child: SvgPicture.asset(Assets.upArrow, height: 15, color: AppColors.primaryColor)),
              onChanged: onValueSelected
          )
          // CustomDropdownButton2(
          //   buttonWidth: width,
          //   value: selectedValue,
          //   hint: hint ?? '',
          //   icon: RotatedBox(
          //       quarterTurns: 2,
          //       child: SvgPicture.asset(Assets.upArrow, height: 15, color: AppColors.primaryColor)),
          //   buttonDecoration: BoxDecoration(
          //     border: Border.all(
          //       color: AppColors.primaryColor,
          //     ),
          //     borderRadius: BorderRadius.circular(
          //       10,
          //     ),
          //   ),
          //   // buttonHeight: 60,
          //   dropdownItems: values,
          //   onChanged: onValueSelected,
          // ),
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
        borderRadius: BorderRadius.circular(15),
      ),
      padding: UIStyleProperties.leftInset10,
      height: Get.height * 0.060,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Expanded(
            child: TitleText(
              text: value,
              color: AppColors.primaryColor,
              weight: FontWeight.w700,
            ),
          ),
          const VerticalDivider(color: AppColors.primaryColor, thickness: 1.0),
          PopupMenuButton(
              onSelected: (item) {},
              icon: RotatedBox(
                  quarterTurns: 2,
                  child: SvgPicture.asset(Assets.upArrow, height: 15, color: AppColors.primaryColor)),
            itemBuilder: (BuildContext context) => List<PopupMenuEntry>.generate(values.length,
                  (index) =>  PopupMenuItem(value: values.elementAt(index),
                    child: Text(values.elementAt(index)),
                  ),),
              // itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              //   const PopupMenuItem(
              //     value: "Emirates ID",
              //     child: Text('Item 1'),
              //   ),
              //   const PopupMenuItem(
              //     value: "itemTwo",
              //     child: Text('Item 2'),
              //   ),
              //   const PopupMenuItem(
              //     value: "itemThree",
              //     child: Text('Item 3'),
              //   ),
              //   const PopupMenuItem(
              //     value: "itemFour",
              //     child: Text('Item 4'),
              //   ),
              // ]
          )
        ],
      ),
    );
  }
}

