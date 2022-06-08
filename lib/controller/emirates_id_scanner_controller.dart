import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../routes/app_routes.dart';

class EmiratesIdScanController extends GetxController with StateMixin {
  //CONSTANTS
  final checkMarkDuration = const Duration(milliseconds: 1500);

  //VARIABLES
  RxBool hasFrontScanned = false.obs;
  RxBool hasBackScanned = false.obs;

  //-------------METHODS--------------
  onQRViewCreated(QRViewController controller) async {
    hasFrontScanned.value = false;
    await Future.delayed(const Duration(seconds: 4));
    change(null, status: RxStatus.success());
    await Future.delayed(const Duration(milliseconds: 2000));
    hasFrontScanned.value = true;
    if(Get.arguments == null) {
      hasFrontScanned.value = false;
      Get.offAndToNamed(AppRoutes.REGISTERSCANNER, arguments: " - Back Side");
    }
    else {
      Get.offAndToNamed(AppRoutes.REGISTERDETAIL);
    }
  }
}
