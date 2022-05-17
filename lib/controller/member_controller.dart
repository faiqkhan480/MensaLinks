import 'package:get/get.dart';

import '../widgets/done_screen.dart';

class MemberController extends GetxController {
  // STATES
  RxBool contactDetail = false.obs;
  RxBool pullBack = false.obs;

  void changeTab(bool val) => contactDetail.value = val;

  void submitPullBackRequest() => pullBack.value = true;

  void confirmPullRequest() {
    pullBack.value = false;
    Get.off(const DoneScreen(message: "100.00 AED has been withdrawn from the card ending with **** and credited to your account"));
  }
}