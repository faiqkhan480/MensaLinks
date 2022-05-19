import 'package:get/get.dart';
import 'package:mensa_links/routes/app_routes.dart';

class HomeController extends GetxController {
  RxBool familyFormSubmitted = false.obs;
  RxBool salaryProcessed = false.obs;
  RxInt selectedTab = 0.obs;

  void handleFamilyForm(bool val) {
    familyFormSubmitted.value = val;
  }

  void toVerifyDoc(bool type) {
    var args = {
      "forWorker": type
    };
    Get.toNamed(AppRoutes.DOCUMENTVERIFICATION, arguments: args);
  }

  void handleTab(int val) => selectedTab.value = val;

  void handleProcessSalary(bool val) => salaryProcessed.value = val;

  void handleConfirm() {
    Get.toNamed(AppRoutes.PIN, arguments: "salary");
  }
}