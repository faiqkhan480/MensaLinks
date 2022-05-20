import 'package:get/get.dart';
import 'package:mensa_links/routes/app_routes.dart';

import '../widgets/done_screen.dart';

class HomeController extends GetxController {
  RxBool businessLogin = true.obs;
  RxBool familyFormSubmitted = false.obs;
  RxBool salaryProcessed = false.obs;
  RxInt selectedTab = 0.obs;

  void handleFamilyForm(bool val) {
    familyFormSubmitted.value = val;
  }

  void toVerifyDoc(String type) {
    var args = {
      "type": type
    };
    Get.toNamed(AppRoutes.DOCUMENTVERIFICATION, arguments: args);
  }

  void handleTab(int val) => selectedTab.value = val;

  void handleProcessSalary(bool val) => salaryProcessed.value = val;

  void handleConfirm() {
    Get.toNamed(AppRoutes.PIN, arguments: "salary");
  }

  void handleRegisterPayment() {
    Get.off(const DoneScreen(message: "Thank you! Verification in progress.", counts: 1,));
  }
}