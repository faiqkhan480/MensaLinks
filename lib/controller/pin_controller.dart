import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/app_routes.dart';
import '../widgets/done_screen.dart';
import '../widgets/loading.dart';

class PinController extends GetxController {
  TextEditingController pinField = TextEditingController();

  void handleChange(val) => (pinField.text.length < 4) ? pinField.text = pinField.text + val : null;

  void handleDelete() => pinField.text = pinField.text.substring(0, pinField.text.length - 1);

  void handleComplete(bool isTransfer) {
    if(isTransfer) {
      Get.off(const DoneScreen(message: "An amount of AED 400.00 has been loaded to the card ending with xxxx", counts: 2,));
    } else {
      Get.to(() =>
          Loading(
            msgBefore: "Pin Set Successfully!\nProceed To Sign In",
            waveLoading: false,
            onComplete: () => null,
            onDone: () => Get.toNamed(AppRoutes.ACCOUNTCREATED, arguments: {'welcome': 'welcome_msg'}),
          ),
      );
    }
  }
}