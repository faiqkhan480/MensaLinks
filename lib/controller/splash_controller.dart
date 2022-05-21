import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../routes/app_routes.dart';

class SplashController extends GetxController {
  Rx<bool> isInitialized = true.obs;
  Rx<bool> loading = true.obs;
  Rx<bool> onSignUp = false.obs;

  @override
  void onInit() async {
    await Future.delayed(
      const Duration(milliseconds: 500),
      () {
        isInitialized.value = false;
        Future.delayed(
          const Duration(
            milliseconds: 1600,
          ),
          () {
            loading.value = false;
          },
        );
      },
    );
    super.onInit();
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
