import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class EmiratesIdScanController extends GetxController with StateMixin {
  //CONSTANTS
  final checkMarkDuration = const Duration(milliseconds: 1500);

  //VARIABLES
  RxBool hasScanned = false.obs;

  //-------------METHODS--------------
  onQRViewCreated(QRViewController controller) async {
    hasScanned.value = false;
    await Future.delayed(const Duration(seconds: 4));
    change(null, status: RxStatus.success());
    await Future.delayed(const Duration(milliseconds: 2000));
    hasScanned.value = true;
    // Get.offAndToNamed(AppRoutes.REGISTERDETAIL);
  }
}
