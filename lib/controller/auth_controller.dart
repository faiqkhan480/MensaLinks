import 'dart:developer';

import 'package:easy_card_scanner/credit_card_scanner.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AuthController extends GetxController {
  Rxn<String> expiryDate = Rxn<String>();
  Rxn<String> expiryMonth = Rxn<String>();
  Rxn<String> expiryYear = Rxn<String>();
  Rxn<String> birthDate = Rxn<String>();
  Rxn<String> birthMonth = Rxn<String>();
  Rxn<String> birthYear = Rxn<String>();
  TextEditingController mobile = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address1 = TextEditingController();
  TextEditingController address2 = TextEditingController();
  TextEditingController poBox = TextEditingController();

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
