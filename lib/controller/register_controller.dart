import 'package:get/get.dart';

class RegisterController extends GetxController {
  Rxn<String> selectedDate = Rxn<String>();

  void onScanNow() async {
    // final front = await CardScanner.scanCard(
    //   scanOptions: const CardScanOptions(
    //     side: 'Front',
    //     scanCardHolderName: true,
    //     scanExpiryDate: true,
    //     cardScannerTimeOut: 20,
    //   ),
    // );
    // final back = await CardScanner.scanCard(
    //   scanOptions: const CardScanOptions(
    //     side: 'Back',
    //     scanCardHolderName: true,
    //     scanExpiryDate: true,
    //     cardScannerTimeOut: 20,
    //   ),
    // );
    // log('Printing Camera Details: ');
  }
}
