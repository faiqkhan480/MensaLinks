import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mrz_scanner/flutter_mrz_scanner.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:get/get.dart';
import 'package:mensa_links/controller/auth_controller.dart';

import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/size_config.dart';
import '../../widgets/custom_animated_checkmark.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/simple_default_layout.dart';
import '../../widgets/text_widgets.dart';

class RegisterScanner extends StatefulWidget {
  RegisterScanner({Key? key}) : super(key: key);

  @override
  State<RegisterScanner> createState() => _RegisterScannerState();
}

class _RegisterScannerState extends State<RegisterScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  AuthController logic = Get.find<AuthController>();

  bool isParsed = false;
  bool isScanned = false;
  bool frontScanned = false;
  bool backScanned = false;
  MRZController? controller;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    // TODO: implement initState
    super.initState();
    requestPermission();
  }

  requestPermission() async {
    if(await Permission.camera.request().isGranted) {

    }
  }

  initialize() async {
    Future.delayed(const Duration(milliseconds: 2200), () {
      setState(() => frontScanned = true);
      Future.delayed(const Duration(milliseconds: 3000), () {
        setState(() {
          frontScanned = false;
          backScanned = true;
        });
      },);
    },);
  }

  @override
  void dispose() {
    controller?.stopPreview();
    super.dispose();
  }

  void onControllerCreated(MRZController controller) {
    this.controller = controller;
    controller.onParsed = (result) async {
      if (isParsed) {
        return;
      }
      isParsed = true;
      var payload = {
        "document_type": result.documentType,
        "country": result.countryCode,
        "sur_names": result.surnames,
        "given_names": result.givenNames,
        "document_number": result.documentNumber,
        "nationality_code": result.nationalityCountryCode,
        "birthdate": result.birthDate,
        "sex": result.sex,
        "expiry_date": result.expiryDate,
        "personal_number": result.personalNumber,
        "personal_number_2": result.personalNumber2,
      };
      setState(() => isScanned = true);
      Future.delayed(const Duration(milliseconds: 1800), () {
        print('CARD DAATA::: $payload');
        logic.setFormValues(result);
      },);

      // await showDialog<void>(
      //     context: context,
      //     builder: (context) => AlertDialog(
      //         content: Column(
      //           mainAxisSize: MainAxisSize.min,
      //           children: <Widget>[
      //             Text('Document type: ${result.documentType}'),
      //             Text('Country: ${result.countryCode}'),
      //             Text('Surnames: ${result.surnames}'),
      //             Text('Given names: ${result.givenNames}'),
      //             Text('Document number: ${result.documentNumber}'),
      //             Text('Nationality code: ${result.nationalityCountryCode}'),
      //             Text('Birthdate: ${result.birthDate}'),
      //             Text('Sex: ${result.sex}'),
      //             Text('Expriy date: ${result.expiryDate}'),
      //             Text('Personal number: ${result.personalNumber}'),
      //             Text('Personal number 2: ${result.personalNumber2}'),
      //             ElevatedButton(
      //               child: const Text('ok'),
      //               onPressed: () {
      //                 isParsed = false;
      //                 return Navigator.pop(context, true);
      //               },
      //             ),
      //           ],
      //         )));
    };
    controller.onError = (error) => print("SCANINGG ERROR:::: $error");

    controller.startPreview();
  }

  @override
  Widget build(BuildContext context) {
    var args = Get.arguments;
    return SimpleDefaultScreenLayout(
      // showAppBar: false,
      // showAppBarBackButton: true,
      // appbarTitle: SvgPicture.asset(
      //   Assets.logo,
      // ),
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              Constants.radius,
            ),
            topRight: Radius.circular(
              Constants.radius,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 20,
                left: 10,
                right: 10,
              ),
              child: TitleText(
                text: 'createAccount'.tr,
                size: Constants.heading,
                color: AppColors.primaryColor,
                weight: FontWeight.bold,
                align: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 20,
                // left: 10,
                // right: 10,
              ),
              child: TitleText(
                text: 'scanID'.tr,
                size: Constants.subHeading,
                align: TextAlign.start,
                color: AppColors.primaryColor,
                weight: FontWeight.bold,
              ),
            ),
            Container(
        margin: const EdgeInsets.only(
          top: 5,
          left: 8,
          right: 8,
        ),
        child: TitleText(
          text: backScanned ? "- Back Side" : "- Front Side",
          size: Constants.subHeading,
          // align: TextAlign.center,
          color: AppColors.primaryColor,
          weight: FontWeight.bold,
        ),
      ),
            const SizedBox(height: 50,),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45),
                child: Stack(
                  children: [
                    RotatedBox(
                      quarterTurns: 0,
                      child: MRZScanner(
                        // withOverlay: true,
                        onControllerCreated: (controller) =>
                            onControllerCreated(controller),
                      ),
                    ),
                    Positioned(
                      top: 35,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Text('pleaseScanTheCode'.tr,
                            style: const TextStyle(color: AppColors.white)),
                      ),
                    ),

                    if(frontScanned || isScanned)
                      _buildAnimatedCheckMark(),

                    Positioned.fill(
                      top: 70,
                      left: 30,
                      bottom: 60,
                      right: 30,
                      child: ColoredBox(
                        color: AppColors.white.withOpacity(.2),
                      ),
                    ),
                    _frames(),
                  ],
                ),
              ),
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }

  _buildAnimatedCheckMark() {
    return const Positioned.fill(
      top: 70,
      left: 30,
      bottom: 60,
      right: 30,
      child: Center(
        child: SizedBox(
          height: 75,
          width: 75,
          child: CustomAnimatedCheckMark(
              strokeWidth: 6,
              duration: Duration(milliseconds: 1500)
          ),
        ),
      ),
    );
  }

  Positioned _buildArrow({
    required double angle,
    double? top,
    double? left,
    double? right,
    double? bottom,
  }) {
    return Positioned(
        top: top,
        left: left,
        right: right,
        bottom: bottom,
        child: Transform.rotate(
            angle: (pi / 180) * angle,
            child: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.white,
            )));
  }

  Positioned _frames() => Positioned(
    top: 70,
    left: 30,
    bottom: 60,
    right: 30,
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        //Top Left
        _buildArrow(angle: 45, top: -5, left: -5),
        //Top Right
        _buildArrow(angle: 135, top: -5, right: -5),
        //Bottom Left
        _buildArrow(angle: -45, bottom: -5, left: -5),
        //Bottom Right
        _buildArrow(angle: -135, bottom: -5, right: -5),
      ],
    ),
  );
}
