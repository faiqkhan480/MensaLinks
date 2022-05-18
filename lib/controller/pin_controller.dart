import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PinController extends GetxController {
  TextEditingController pinField = TextEditingController();

  void handleChange(val) => (pinField.text.length < 4) ? pinField.text = pinField.text + val : null;

  void handleDelete() => pinField.text = pinField.text.substring(0, pinField.text.length - 1);
}