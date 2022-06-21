import 'dart:developer';

import 'package:blinkid_flutter/microblink_scanner.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mrz_parser/mrz_parser.dart';

import '../models/id_card.dart';
import '../routes/app_routes.dart';

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

  // @override
  // void onInit() async {
  //   super.onInit();
  //   // setFormValues();
  // }

  void setFormValues(MRZResult cardData) async {
    fullName.text = cardData.givenNames;
    idNumber.text = cardData.personalNumber;
    birthDate.value = DateFormat("dd").format(cardData.birthDate);
    birthMonth.value = DateFormat("MMM").format(cardData.birthDate);
    birthYear.value = DateFormat("yyyy").format(cardData.birthDate);
    expiryDate.value = DateFormat("dd").format(cardData.expiryDate);
    expiryMonth.value = DateFormat("MMM").format(cardData.expiryDate);
    expiryYear.value = DateFormat("yyyy").format(cardData.expiryDate);
    Get.offAndToNamed(AppRoutes.REGISTERDETAIL);
  }

  setScanValues(BlinkIdCombinedRecognizerResult cardData) {
    fullName.text = (cardData.fullName ?? "").replaceAll("\n", " ");
    idNumber.text = cardData.personalIdNumber ?? "";
    if(cardData.dateOfBirth != null)
      {
       DateTime _dob = DateTime(cardData.dateOfBirth!.year!, cardData.dateOfBirth!.month!, cardData.dateOfBirth!.day!);
        birthDate.value = DateFormat("dd").format(_dob);
        birthMonth.value = DateFormat("MMM").format(_dob);
        birthYear.value = DateFormat("yyyy").format(_dob);
      }
    if(cardData.dateOfExpiry != null)
      {
        DateTime _expiry = DateTime(cardData.dateOfExpiry!.year!, cardData.dateOfExpiry!.month!, cardData.dateOfExpiry!.day!);
        expiryDate.value = DateFormat("dd").format(_expiry);
        expiryMonth.value = DateFormat("MMM").format(_expiry);
        expiryYear.value = DateFormat("yyyy").format(_expiry);
      }
    // Get.offAndToNamed(AppRoutes.REGISTERDETAIL);
    Get.toNamed(AppRoutes.REGISTERDETAIL);
  }

  void handleEditForm(bool val) {
    isReadOnly.value = val;
  }
}
