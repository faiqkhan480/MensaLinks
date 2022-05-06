import 'package:flutter/material.dart';
import 'package:mensa_links/utils/colors.dart';
import 'package:mensa_links/utils/screen_properties.dart';

class CustomSmallDivider extends StatelessWidget {
  const CustomSmallDivider({
    Key? key,
    this.dividerColor,
  }) : super(key: key);
  final Color? dividerColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 8,
      decoration: BoxDecoration(
        borderRadius: UIStyleProperties.borderRadius10,
        color: dividerColor ?? AppColors.backgroundColor,
      ),
    );
  }
}
