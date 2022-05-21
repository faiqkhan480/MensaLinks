import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mensa_links/controller/home_controller.dart';

import '../routes/app_routes.dart';
import '../widgets/done_screen.dart';
import '../widgets/loading.dart';

class PinController extends GetxController {
  TextEditingController pinField = TextEditingController();
  RxBool reEnterPin = false.obs;

  void handleChange(val) => (pinField.text.length < 4) ? pinField.text = pinField.text + val : null;

  void handleDelete() => pinField.text = pinField.text.substring(0, pinField.text.length - 1);

  void handleComplete([String? args]) {
    "Pin Set Successfully!\nProceed To Sign In";
    switch (args) {
      case "transfer":
        Get.off(const DoneScreen(message: "An amount of AED 400.00 has been loaded to the card ending with xxxx", counts: 2,));
        break;
      case "salary":
        Get.find<HomeController>().handleProcessSalary(false);
        Get.off(const DoneScreen(message: "Salary Process Request Submitted", counts: 2,));
        break;
      case "staff":
        Get.find<HomeController>().handleProcessSalary(false);
        Get.find<HomeController>().setRadioValue(0);
        Get.off(const DoneScreen(message: "Salary Process Request Submitted", counts: 3,));
        break;
      case "signup":
        handleSubmitPin();
        // reEnterPin.value = true;
        break;
      default:
        Get.to(() =>
            Loading(
              msgBefore: "Pin Set Successfully!\nProceed To Sign In",
              waveLoading: false,
              onComplete: () => null,
              onDone: () => Get.toNamed(AppRoutes.ACCOUNTCREATED, arguments: {'welcome': 'welcome_msg'}),
            ),
        );
        break;
    }
  }

  void handleSubmitPin() {
    if(reEnterPin()){
      Get.to(() =>
          Loading(
            msgBefore: "Pin Set Successfully!\nProceed To Sign In",
            waveLoading: false,
            onComplete: () => null,
            onDone: () => Get.toNamed(AppRoutes.ACCOUNTCREATED, arguments: {'welcome': 'welcome_msg'}),
          ),
      );
    }
    else{
      reEnterPin.value = true;
      pinField.clear();
    }
  }
}