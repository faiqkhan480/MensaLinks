import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:mensa_links/utils/colors.dart';
import 'package:mensa_links/utils/constants.dart';
import 'package:mensa_links/widgets/title_text.dart';

class CustomDropdown extends StatelessWidget {
  final List<String> values;
  final Function(String?) onValueSelected;
  final String label;
  final String? hint, selectedValue;
  final double width;

  const CustomDropdown({
    Key? key,
    required this.label,
    required this.onValueSelected,
    required this.width,
    required this.values,
    this.selectedValue,
    this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleText(
            text: label,
            color: AppColors.primaryColor.withOpacity(0.5),
            weight: FontWeight.bold,
            size: Constants.subHeading2,
          ),
          CustomDropdownButton2(
            buttonWidth: width,
            value: selectedValue,
            hint: hint ?? '',
            buttonDecoration: BoxDecoration(
              border: Border.all(
                color: AppColors.primaryColor,
              ),
              borderRadius: BorderRadius.circular(
                15,
              ),
            ),
            buttonHeight: 60,
            dropdownItems: values,
            onChanged: onValueSelected,
          ),
        ],
      ),
    );
  }
}
