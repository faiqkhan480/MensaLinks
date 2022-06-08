import 'package:get/get.dart';

import '../widgets/done_screen.dart';
import '../widgets/loading.dart';

class MemberController extends GetxController {
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
}