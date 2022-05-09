import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../utils/colors.dart';

class CustomPinCodeField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String)? onComplete;
  final bool isObscured;
  final TextStyle? textStyle;
  final Color? backgroundColor, cursorColor;
  final double? fieldWidth, fieldHeight;
  final TextInputType? keyboardType;
  const CustomPinCodeField({
    Key? key,
    this.controller,
    this.validator,
    this.onComplete,
    this.textStyle,
    this.fieldWidth,
    this.fieldHeight,
    this.keyboardType,
    this.backgroundColor,
    this.cursorColor,
    this.isObscured = true,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: .7,
      child: PinCodeTextField(
          cursorColor: cursorColor,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          appContext: context,
          controller: controller,
          onCompleted: onComplete,
          validator: validator,
          boxShadows: [
            BoxShadow(
                color:
                    backgroundColor ?? AppColors.primaryColor.withOpacity(.8))
          ],
          textStyle: textStyle ??
              const TextStyle(color: AppColors.white, fontSize: 24),
          keyboardType: keyboardType ?? TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          obscureText: isObscured,
          pinTheme: PinTheme(
            // inactiveFillColor: AppColors.primaryColor,
            // activeFillColor: AppColors.primaryColor,
            // disabledColor: AppColors.primaryColor,
            activeColor: AppColors.transparent,
            // // inactiveColor: AppColors.primaryColor,
            fieldWidth: fieldWidth ?? 50,
            fieldHeight: fieldHeight,
            selectedColor: AppColors.transparent,
            shape: PinCodeFieldShape.box,
            inactiveColor: AppColors.transparent,
            // activeFillColor: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10),
            selectedFillColor: AppColors.primaryColor,
          ),
          length: 4,
          onChanged: (value) {}),
    );
  }
}
