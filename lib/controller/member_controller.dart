import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mensa_links/utils/constants.dart';

import '../widgets/done_screen.dart';
import '../widgets/loading.dart';

class MemberController extends GetxController {
  TextEditingController nickName = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController idNum = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address1 = TextEditingController();
  TextEditingController address2 = TextEditingController();
  TextEditingController poBox = TextEditingController();
  String expiryDate = "";
  String expiryMonth = "";
  String expiryYear = "";
  String birthDate = "";
  String birthMonth = "";
  String birthYear = "";

  // STATES
  RxBool contactDetail = false.obs;
  RxBool pullBack = false.obs;
  RxString emiratesId = "Emirates ID".obs;

  void changeTab(bool val) => contactDetail.value = val;

  void submitPullBackRequest() => pullBack.value = true;

  void confirmPullRequest() {
    String _msg = "100.00 AED has been withdrawn from the card ending with **** and credited to your account";
    pullBack.value = false;
    Get.off(() =>
        Loading(
            waveLoading: false,
            msgBefore: _msg,
            msgAfter: _msg,
            onComplete: () => null,
            onDone: () {
              Get.close(2);
            })
    );
    // Get.off(const DoneScreen(message: "100.00 AED has been withdrawn from the card ending with **** and credited to your account"));
  }

  void handleEmiratesID(String? val) {
    emiratesId.value = val!;
  }

  void setFormValues(index) {
    nickName.text = Constants.membersList.elementAt(index);
    firstName.text = Constants.membersList.elementAt(index);
    lastname.text = Constants.membersList.elementAt(index);
    idNum.text = "3249324098324-1";
    mobile.text = "09039829329";
    email.text = "user@example.com";
    address1.text = "B1 block 13";
    address2.text = "B2 block 13A";
    poBox.text = "0908";
    expiryDate = "24";
    expiryMonth = "Aug";
    expiryYear = "2022";
    birthDate = "12";
    birthMonth = "Dec";
    birthYear = "1999";
  }
}