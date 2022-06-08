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
  final double? width, fontSize;
  final EdgeInsets? contentPadding;
  final bool? filled, invert, readOnly;

  const CustomDropdown({
    Key? key,
    this.label,
    this.fontSize,
    required this.onValueSelected,
    this.width,
    required this.values,
    this.selectedValue,
    this.hint,
    this.filled,
    this.contentPadding,
    this.readOnly = false,
    this.invert = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: label != null ? 10 : 0,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(label != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TitleText(
              text: label!,
              color: AppColors.primaryColor.withOpacity(0.5),
              weight: FontWeight.bold,
              size: Constants.heading18,
          ),
            ),
          DropdownButtonFormField(
              value: selectedValue,
              items: values.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: TitleText(
                    text: value,
                    size: fontSize,
                    weight: FontWeight.w700,
                    color: invert == true ? AppColors.white : AppColors.primaryColor,
                  ),
                );
              }).toList(),
              dropdownColor: invert == true ? AppColors.ultraDarkGrey : AppColors.white,
              hint: TitleText(
                text: hint ?? '',
                size: fontSize,
                weight: FontWeight.w700,
                color: filled != null && filled! ?
                AppColors.primaryColor :
                invert! ?
                AppColors.white :
                AppColors.darkGrey,
              ),
              decoration: InputDecoration(
                filled: (filled ?? false) || invert!,
                fillColor: invert! ? AppColors.primaryColor : AppColors.ultraDarkGrey,
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
                contentPadding: contentPadding ?? EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0, top: 10.0),
                // labelText: widget.title,
              ),
              icon: RotatedBox(
                  quarterTurns: 2,
                  child: SvgPicture.asset(Assets.upArrow, height: 15, color: invert! ? AppColors.white : AppColors.primaryColor)),
              onChanged: readOnly! ? null : onValueSelected,
          )
        ],
      ),
    );
  }
}

class DropdownMenuField extends StatelessWidget {
  final List<String> values;
  final String value;
  final Function(String?)? onValueSelected;
  const DropdownMenuField({Key? key, required this.values, required this.value, this.onValueSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(

          border: Border.all(color: AppColors.primaryColor, width: 1.0),
          borderRadius: BorderRadius.circular(Constants.textFieldRadius),
        ),
        // padding: UIStyleProperties.leftInset10,
        height:49,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Expanded(
               flex: 2,
              child: Center(
                child: TitleText(
                  text: value,
                  color: AppColors.primaryColor,
                  weight: FontWeight.w700,
                  size: Constants.regularText,
                ),
              ),
            ),
            // const SizedBox(width: 8),
            // const VerticalDivider(color: AppColors.primaryColor, thickness: 1.0, width: 1),
            Container( height: 50,width: 1, color: AppColors.primaryColor),

            PopupMenuButton(

              padding: EdgeInsets.zero,
                onSelected: (item) {
                  if(onValueSelected != null)
                   onValueSelected!(item.toString());
                },
                icon: RotatedBox(
                    quarterTurns: 2,
                    child: SvgPicture.asset(Assets.upArrow, height: 15, color: AppColors.primaryColor)),
              itemBuilder: (BuildContext context) => List<PopupMenuEntry>.generate(values.length,
                    (index) =>  PopupMenuItem( value: values.elementAt(index),
                      child: Text(values.elementAt(index)),
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

