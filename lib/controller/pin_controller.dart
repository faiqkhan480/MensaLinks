import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mensa_links/controller/home_controller.dart';

import '../routes/app_routes.dart';
import '../widgets/done_screen.dart';
import '../widgets/loading.dart';

class PinController extends GetxController {
  TextEditingController pinField = TextEditingController();

  void handleChange(val) => (pinField.text.length < 4) ? pinField.text = pinField.text + val : null;

  void handleDelete() => pinField.text = pinField.text.substring(0, pinField.text.length - 1);

  void handleComplete([String? args]) {
    bool isTransfer = args == "transfer";
    bool isSalary = args == "salary";
    bool isStaff = args == "staff";
    String _msg = isTransfer ? "An amount of AED 400.00 has been loaded to the card ending with xxxx" :
    isSalary ? "Salary Process Request Submitted" :
    "Pin Set Successfully!\nProceed To Sign In";
    switch (args) {
      case "transfer":
        Get.off(DoneScreen(message: _msg, counts: 2,));
        break;
      case "salary":
        Get.find<HomeController>().handleProcessSalary(false);
        Get.off(DoneScreen(message: _msg, counts: 2,));
        break;
      case "staff":
        Get.find<HomeController>().handleProcessSalary(false);
        Get.off(DoneScreen(message: _msg, counts: 3,));
        break;
      default:
        Get.to(() =>
            Loading(
              msgBefore: _msg,
              waveLoading: false,
              onComplete: () => null,
              onDone: () => Get.toNamed(AppRoutes.ACCOUNTCREATED, arguments: {'welcome': 'welcome_msg'}),
            ),
        );
        break;
    }
  }
}