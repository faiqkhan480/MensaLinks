import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mensa_links/utils/colors.dart';
import 'package:mensa_links/utils/constants.dart';
import 'package:mensa_links/widgets/text_widgets.dart';

import '../utils/assets.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final TextEditingController controller;
  final bool? hideText, filled, editIcon;
  final int? lines;
  const CustomTextField({
    Key? key,
    this.label,
    required this.controller,
    this.hideText,
    this.hintText,
    this.editIcon = false,
    this.lines,
    this.filled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          label != null
              ? TitleText(
                  text: label!,
                  color: AppColors.primaryColor.withOpacity(0.5),
                  weight: FontWeight.bold,
                  size: Constants.heading18,
                )
              : const SizedBox(),
          TextFormField(
            maxLines: lines ?? 1,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  15,
                ),
                borderSide: const BorderSide(
                  color: AppColors.primaryColor,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  15,
                ),
                borderSide: const BorderSide(
                  color: AppColors.primaryColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  15,
                ),
                borderSide: const BorderSide(
                  color: AppColors.primaryColor,
                ),
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: filled != null && filled! ? AppColors.primaryColor : AppColors.ultraDarkGrey,
              ),
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.darkGrey,
              ),
              suffixIcon: editIcon! ? const Icon(Icons.edit_rounded, color: AppColors.primaryColor) : null,
              filled: filled,
              fillColor: AppColors.ultraDarkGrey,
              isDense: true,
            ),
            controller: controller,
            obscureText: hideText ?? false,
          ),
        ],
      ),
    );
  }
}

class TextDropdownField extends StatelessWidget {
  final int? flexField, flexDropdown;
  final String? hintText;
  const TextDropdownField({Key? key, this.flexDropdown, this.flexField, this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryColor, width: 1.0),
        borderRadius: BorderRadius.circular(10),
      ),
      height: Get.height * 0.060,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            flex: flexField ?? 4,
            child: TextFormField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  errorBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: hintText,
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: AppColors.darkGrey,
                  )
              ),
              // controller: controller,
              // obscureText: hideText ?? false,
            ),
          ),
          const VerticalDivider(color: AppColors.primaryColor, thickness: 1.0),
          Expanded(
            flex: flexDropdown ?? 1,
            child: DropdownButtonFormField(
                value: 'AED',
                // style: const TextStyle(fontWeight: FontWeight.w700),
                items: ['AED', 'ARR'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: TitleText(text: value, color: AppColors.primaryColor, weight: FontWeight.w700),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  // fillColor: Colors.white,
                  border: InputBorder.none,
                  errorBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  // filled: true,
                  contentPadding: EdgeInsets.only(left: 10),
                  // labelText: widget.title,
                ),
                icon: RotatedBox(
                    quarterTurns: 2,
                    child: SvgPicture.asset(Assets.upArrow, height: 15, color: AppColors.primaryColor)),
                onChanged: (val) => null
            ),
          ),
        ],
      ),
    );
  }
}
