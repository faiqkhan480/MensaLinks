import 'dart:developer';

import 'package:easy_card_scanner/credit_card_scanner.dart';
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
    // var payload  = {
    //   "document_type": "IL",
    //   "country": "ARE",
    //   "sur_names": "PAULOSE",
    //   "given_names": "SAJNA ROSE SAJAN OKKA",
    //   "document_number": 104688349,
    //   "nationality_code": "IHD",
    //   "birthdate": 1995-05-24 00:00:00.000,
    //   "sex": "Sex.female",
    //   "expiry_date": 2023-03-20 00:00:00.000,
    //   "personal_number": 784199513983694,
    //   "personal_number_2": ""
    // };
    // IdCard? get args => IdCard.fromMap(Get.arguments);

    // DateTime? _dob = cardData.birthDate != null ? cardData.birthdate! : null;
    // DateTime? _expiry = cardData.birthdate != null ? cardData.birthdate! : null;

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
