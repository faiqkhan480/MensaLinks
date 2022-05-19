import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/pin_controller.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/screen_properties.dart';
import '../../widgets/custom_pin_field.dart';
import '../../widgets/keypad.dart';
import '../../widgets/simple_default_layout.dart';
import '../../widgets/text_widgets.dart';

class PinScreen extends StatelessWidget {
  PinScreen({Key? key}) : super(key: key);

  final PinController _controller = Get.put(PinController());
  final args = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return SimpleDefaultScreenLayout(
      child: loginOtp(),
    );
  }

  Widget loginOtp() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: UIStyleProperties.insetsVrt20Hzt20,
          child: TitleText(
            text: 'enter_your_new_pin',
            size: Constants.heading20,
            weight: FontWeight.w700,
            color: AppColors.primaryColor,
          ),
        ),

        Container(
          // padding: UIStyleProperties.topInset10,
          alignment: Alignment.center,
          child: CustomPinCodeField(
            controller: _controller.pinField,
            backgroundColor: AppColors.skyLightColor,
            isObscured: false,
            fieldHeight: 80,
            fieldWidth: 55,
            keyboardType: TextInputType.none,
            onComplete: (val) => _controller.handleComplete(args),
          ),
        ),

        Flexible(
          child: CustomPinKeyboard(
            controller: _controller,
            delete: _controller.handleDelete,
          ),
        ),
      ],
    );
  }
}