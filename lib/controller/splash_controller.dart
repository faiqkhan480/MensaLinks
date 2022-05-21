import 'package:get/get.dart';

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
}
