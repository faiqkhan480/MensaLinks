import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../routes/app_routes.dart';

class SplashController extends GetxController {
  Rx<bool> isInitialized = true.obs;
  Rx<bool> loading = true.obs;
  Rx<bool> onSignUp = false.obs;

  @override
  void onInit() async {
    super.onInit();
    Future.delayed(
      const Duration(milliseconds: 800),
      () {
        isInitialized.value = false;
        Future.delayed(
          const Duration(
            milliseconds: 1800,
          ),
          () {
            loading.value = false;
          },
        );
      },
    );
  }

  void onSignUpPressed() {
    onSignUp.value = true;
  }

  void handleNavigation(String type) {
    final _box = GetStorage();
    _box.write("loginType", type);
    Get.toNamed(AppRoutes.REGISTER);
  }
}
