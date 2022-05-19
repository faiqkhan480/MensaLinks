import 'package:get/get.dart';

import '../widgets/done_screen.dart';
import '../widgets/loading.dart';

class MemberController extends GetxController {
  // STATES
  RxBool contactDetail = false.obs;
  RxBool pullBack = false.obs;

  void changeTab(bool val) => contactDetail.value = val;

  void submitPullBackRequest() => pullBack.value = true;

  void confirmPullRequest() {
    pullBack.value = false;
    Get.off(() =>
        Loading(
            waveLoading: false,
            msgBefore: "100.00 AED has been withdrawn from the card ending with **** and credited to your account",
            msgAfter: "100.00 AED has been withdrawn from the card ending with **** and credited to your account",
            onComplete: () => null,
            onDone: () {
              Get.close(2);
            })
    );
    // Get.off(const DoneScreen(message: "100.00 AED has been withdrawn from the card ending with **** and credited to your account"));
  }
}