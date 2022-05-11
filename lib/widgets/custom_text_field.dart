import 'package:flutter/material.dart';
import 'package:mensa_links/utils/colors.dart';
import 'package:mensa_links/utils/constants.dart';
import 'package:mensa_links/widgets/title_text.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final TextEditingController controller;
  final bool? hideText;
  const CustomTextField({
    Key? key,
    this.label,
    required this.controller,
    this.hideText,
    this.hintText,
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
            ),
            controller: controller,
            obscureText: hideText ?? false,
          ),
        ],
      ),
    );
  }
}
