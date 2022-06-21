import 'dart:developer';

import 'package:blinkid_flutter/microblink_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_mrz_scanner/flutter_mrz_scanner.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../controller/auth_controller.dart';
import '../../routes/app_routes.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/screen_properties.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/simple_default_layout.dart';
import '../../widgets/text_widgets.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String _resultString = "";

  final AuthController logic = Get.find<AuthController>();

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    // TODO: implement initState
    super.initState();
    requestPermission();
  }

  requestPermission() async {
    PermissionStatus  status = await Permission.camera.status;
    await Permission.camera.request();
    status = await Permission.camera.status;
    if(status == PermissionStatus.denied || status == PermissionStatus.permanentlyDenied) {
      await openAppSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    print("RESUT::: ${_resultString}");
    return SimpleDefaultScreenLayout(
      pageTitle: "createAccount",
      // pageTitleSize: 0.060,
      showAppBarBackButton: true,
      child: _body(
      ),
    );
  }

  Widget _body() {
    return ListView(
      physics: Constants.scrollPhysics,
      padding: UIStyleProperties.insetsVrt8Hzt20,
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 20,
            left: 10,
            right: 10,
          ),
          child: TitleText(
            text: 'scanID'.tr,
            size: Constants.heading20,
            align: TextAlign.center,
            color: AppColors.primaryColor,
            weight: FontWeight.bold,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 20,
            left: 10,
            right: 10,
          ),
          child: TitleText(
            text: 'scanIdDesc'.tr,
            align: TextAlign.center,
            color: AppColors.primaryColor,
          ),
        ),
        const SizedBox(
          height: 70,
        ),
        CustomButton(
          onTap: () async {
            scan();
            // if(await Permission.camera.request().isGranted) {
            //   Get.toNamed(AppRoutes.REGISTERSCANNER);
            // }
            // else {
            //   Get.snackbar("Camera Permissin Required!", "please allow app Camera permission in your phone setting", backgroundColor: Colors.red, colorText: Colors.white);
            // }
          },
          label: 'scanNow'.tr,
        ),
      ],
    );
  }

  Future<void> scan() async {
    String? license;
    List<RecognizerResult> results = [];
    Recognizer recognizer = BlinkIdCombinedRecognizer();
    BlinkIdCombinedRecognizer idRecognizer = BlinkIdCombinedRecognizer();
    OverlaySettings settings = BlinkIdOverlaySettings();

    // set your license
    if (Theme
        .of(context)
        .platform == TargetPlatform.iOS) {
      license =
      "sRwAAAEYY29tLmV1c29waHQubWVuc2EtbGxpbmtzYLydYLmrtY59DLuohy03oq+VQxlxpwGZ1qQ4YXQ2n514SGZA8NTBKUH06xt+0BsDg2A1/FjLL3JleGCsy/pMuazjMkg77uzEqzdWJCh9ul2lZvVc+ltdnudk2IlNHWrXL505/Tkcl3pj/21A5wuq3Y4zYnicdwSjQB4WYbrr/fbRLceV4i4bZW7De0idDgPj4sTtFoMspdPB/MihVFhEpVtxARcAEFm/wzDuEqwqYkA=";
    } else if (Theme
        .of(context)
        .platform == TargetPlatform.android) {
      license =
      "sRwAAAAXY29tLmV1c29waHQubWVuc2FfbGlua3PZDi3Ac++5PmFpZCE9TQ3dfsyQAPK4AI1ClfQ6G5Yz//Ghw1ameUhugtjq0bFNWroYbJm4Qsbxe8uva8L/Sy9ijrSo0xt/nIT1oegeVtDuZJbMRTewDuny7ZH89tey0zzdTVP36hmzarcVVvk/rclL9/S4cVF6/ESBpWARSjPFmbV+xbWZx3S3292qan8+KKc2zmwWBepHqiPIOmxTLxZLRU3Qa7VaOmVjItc844w88w==";
    }

    try {
      // perform scan and gather results
      results = await MicroblinkScanner.scanWithCamera(RecognizerCollection([recognizer]), settings, license!);
      if (!mounted) return;

      if (results.isEmpty) return;
      for (var result in results) {
        print(result.runtimeType);
        if (result is BlinkIdCombinedRecognizerResult) {
          _resultString = getIdResultString(result);
          // logic.setScanValues(result);
          setState(() {
            _resultString = _resultString;
            // _fullDocumentFrontImageBase64 = result.fullDocumentFrontImage ?? "";
            // _fullDocumentBackImageBase64 = result.fullDocumentBackImage ?? "";
            // _faceImageBase64 = result.faceImage ?? "";
          });

          // return;
        }
      }
      await showDialog<void>(
          context: context,
          builder: (context) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(_resultString),
                  ElevatedButton(
                    child: const Text('ok'),
                    onPressed: () {
                      return Navigator.pop(context, true);
                    },
                  ),
                ],
              )));
    } on PlatformException {
      // handle exception
    }
  }

  String getIdResultString(BlinkIdCombinedRecognizerResult result) {
    return buildResult(result.firstName, "First name") +
        // buildResult(result.lastName, "Last name") +
        // buildResult(result.fullName, "Full name") +
        // buildResult(result.localizedName, "Localized name") +
        // buildResult(result.additionalNameInformation, "Additional name info") +
        // buildResult(result.address, "Address") +
        // buildResult(result.additionalAddressInformation, "Additional address info") +
        // buildResult(result.documentNumber, "Document number") +
        // buildResult(result.documentAdditionalNumber, "Additional document number") +
        // buildResult(result.sex, "Sex") +
        // buildResult(result.issuingAuthority, "Issuing authority") +
        // buildResult(result.nationality, "Nationality") +
        // buildDateResult(result.dateOfBirth, "Date of birth") +
        // buildIntResult(result.age, "Age") +
        // buildDateResult(result.dateOfIssue, "Date of issue") +
        // buildDateResult(result.dateOfExpiry, "Date of expiry") +
        // buildResult(result.dateOfExpiryPermanent.toString(), "Date of expiry permanent") +
        // buildResult(result.maritalStatus, "Martial status") +
        // buildResult(result.personalIdNumber, "Personal Id Number") +
        // buildResult(result.profession, "Profession") +
        // buildResult(result.race, "Race") +
        // buildResult(result.religion, "Religion") +
        // buildResult(result.residentialStatus, "Residential Status") +
        buildResult(result.mrzResult?.age?.toString(), "MRZ AGE") +
        buildResult(result.mrzResult?.alienNumber, "MRZ ALIEN NUMBER") +
        buildResult(result.mrzResult?.applicationReceiptNumber, "MRZ RECIEPT NUMBER") +
        buildResult(result.mrzResult?.documentCode, "MRZ DOC CODE") +
        buildResult(result.mrzResult?.immigrantCaseNumber, "MRZ CASE NUMBER") +
        buildResult(result.mrzResult?.primaryId, "MRZ PRIMARY ID") +
        buildResult(result.mrzResult?.documentNumber, "MRZ DOC NUMBeR") +
        buildResult(result.mrzResult?.issuer, "MRZ ISSUER");
  }

  String buildResult(String? result, String propertyName) {
    if (result == null || result.isEmpty) {
      return "";
    }

    return propertyName + ": " + result + "\n";
  }

  String buildDateResult(Date? result, String propertyName) {
    if (result == null || result.year == 0) {
      return "";
    }

    return buildResult(
        "${result.day}.${result.month}.${result.year}", propertyName);
  }

  String buildIntResult(int? result, String propertyName) {
    if (result == null || result < 0) {
      return "";
    }

    return buildResult(result.toString(), propertyName);
  }

  String buildDriverLicenceResult(DriverLicenseDetailedInfo? result) {
    if (result == null) {
      return "";
    }

    return buildResult(result.restrictions, "Restrictions") +
        buildResult(result.endorsements, "Endorsements") +
        buildResult(result.vehicleClass, "Vehicle class") +
        buildResult(result.conditions, "Conditions");
  }

  // String getPassportResultString(BlinkIdCombinedRecognizerResult? result) {
  //
  //   if(result == null){
  //     return "";
  //   }
  //
  //   var dateOfBirth = "";
  //   if (result.mrzResult?.dateOfBirth != null) {
  //     dateOfBirth = "Date of birth: ${result.mrzResult!.dateOfBirth?.day}."
  //         "${result.mrzResult!.dateOfBirth?.month}."
  //         "${result.mrzResult!.dateOfBirth?.year}\n";
  //   }
  //
  //   var dateOfExpiry = "";
  //   if (result.mrzResult?.dateOfExpiry != null) {
  //     dateOfExpiry = "Date of expiry: ${result.mrzResult?.dateOfExpiry?.day}."
  //         "${result.mrzResult?.dateOfExpiry?.month}."
  //         "${result.mrzResult?.dateOfExpiry?.year}\n";
  //   }
  //
  //   return "First name: ${result.mrzResult?.secondaryId}\n"
  //       "Last name: ${result.mrzResult?.primaryId}\n"
  //       "Document number: ${result.mrzResult?.documentNumber}\n"
  //       "Sex: ${result.mrzResult?.gender}\n"
  //       "$dateOfBirth"
  //       "$dateOfExpiry";
  // }
}
