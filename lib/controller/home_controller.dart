import 'package:get/get.dart';
import 'package:mensa_links/routes/app_routes.dart';

class HomeController extends GetxController {
  RxBool familyFormSubmitted = false.obs;

  void handleFamilyForm(bool val) {
    familyFormSubmitted.value = val;
  }

  void toVerifyDoc() {
    Get.toNamed(AppRoutes.DOCUMENTVERIFICATION, arguments: 'fromAccount');
  }
}