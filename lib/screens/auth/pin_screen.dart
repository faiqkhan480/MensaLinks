import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mensa_links/controller/auth_controller.dart';
import 'package:mensa_links/routes/app_routes.dart';

import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/screen_properties.dart';
import '../../widgets/custom_pin_field.dart';
import '../../widgets/keypad.dart';
import '../../widgets/loading.dart';
import '../../widgets/simple_default_layout.dart';
import '../../widgets/title_text.dart';

class PinScreen extends StatelessWidget {
  PinScreen({Key? key}) : super(key: key);

  final AuthController controller = Get.find<AuthController>();
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
          padding: UIStyleProperties.insetsHzt20,
          child: TitleText(
            text: 'enter_your_new_pin',
            size: Constants.heading20,
            weight: FontWeight.w700,
            color: AppColors.primaryColor,
          ),
        ),

        Container(
          padding: const EdgeInsets.only(top: 15),
          alignment: Alignment.center,
          child: CustomPinCodeField(
            controller: controller.pinField,
            backgroundColor: AppColors.skyLightColor,
            isObscured: false,
            fieldHeight: 60,
            cursorColor: AppColors.slightlyGrey,
            keyboardType: TextInputType.none,
            onComplete: (val) => Get.to(
                  () => Loading(
                    waveLoading: false,
                    onComplete: () => null,
                    onDone: () => Get.toNamed(AppRoutes.ACCOUNTCREATED, arguments: {'welcome': 'welcome_msg'}),
                  ),
            ),
            // onComplete: (val) => Get.toNamed(AppRoutes.DOCUMENTVERIFICATION),
            textStyle: const TextStyle(fontSize: 26, color: AppColors.white),
          ),
        ),

        Expanded(
          child: CustomPinKeyboard(
            controller: controller,
            delete: controller.handleDelete,
          ),
        ),
      ],
    );
  }
}