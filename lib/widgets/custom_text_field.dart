import 'package:flutter/material.dart';
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
      margin: const EdgeInsets.only(top: 5),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleText(
            text: label ?? '',
            color: Constants.primaryColor.withOpacity(0.5),
            weight: FontWeight.bold,
            size: Constants.subHeading2,
          ),
          SizedBox(
            height: 60,
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                  borderSide: BorderSide(
                    color: Constants.primaryColor,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                  borderSide: BorderSide(
                    color: Constants.primaryColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                  borderSide: BorderSide(
                    color: Constants.primaryColor,
                  ),
                ),
                hintText: hintText,
              ),
              controller: controller,
              obscureText: hideText ?? false,
            ),
          ),
        ],
      ),
    );
  }
}
