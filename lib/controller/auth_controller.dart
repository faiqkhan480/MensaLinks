import 'dart:developer';

import 'package:easy_card_scanner/credit_card_scanner.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AuthController extends GetxController {
  RxBool isReadOnly = true.obs;
  RxString expiryDate = RxString("");
  RxString expiryMonth = RxString("");
  RxString expiryYear = RxString("");
  RxString birthDate = RxString("");
  RxString birthMonth = RxString("");
  RxString birthYear = RxString("");
  TextEditingController mobile = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address1 = TextEditingController();
  TextEditingController address2 = TextEditingController();
  TextEditingController poBox = TextEditingController();

  TextEditingController fullName = TextEditingController();
  TextEditingController idNumber = TextEditingController();

  List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  @override
  void onInit() async {
    super.onInit();
    setFormValues();
  }

  void setFormValues() async {
    fullName.text = "Jobin StartLy";
    idNumber.text = "784-xxxx-xxxxxx-x";
    expiryDate.value = "26";
    expiryMonth.value = "Jun";
    expiryYear.value = "2022";
    birthDate.value = "20";
    birthMonth.value = "Mar";
    birthYear.value = "2008";
  }

  void handleEditForm(bool val) {
    isReadOnly.value = val;
  }

  Future<void> onScanNow() async {
    final front = await CardScanner.scanCard(
      scanOptions: const CardScanOptions(
        side: 'Front',
        scanCardHolderName: true,
        scanExpiryDate: true,
        cardScannerTimeOut: 20,
      ),
    );
    final back = await CardScanner.scanCard(
      scanOptions: const CardScanOptions(
        side: 'Back',
        scanCardHolderName: true,
        scanExpiryDate: true,
        cardScannerTimeOut: 20,
      ),
    );
    log('Printing Camera Details: ');
  }
}
