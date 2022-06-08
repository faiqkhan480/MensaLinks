import 'package:flutter/material.dart';
import 'package:flutter_mrz_scanner/flutter_mrz_scanner.dart';
import 'package:get/get.dart';

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
  final AuthController logic = Get.find<AuthController>();

  bool isParsed = false;
  MRZController? controller;

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

      await showDialog<void>(
          context: context,
          builder: (context) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('Document type: ${result.documentType}'),
                  Text('Country: ${result.countryCode}'),
                  Text('Surnames: ${result.surnames}'),
                  Text('Given names: ${result.givenNames}'),
                  Text('Document number: ${result.documentNumber}'),
                  Text('Nationality code: ${result.nationalityCountryCode}'),
                  Text('Birthdate: ${result.birthDate}'),
                  Text('Sex: ${result.sex}'),
                  Text('Expriy date: ${result.expiryDate}'),
                  Text('Personal number: ${result.personalNumber}'),
                  Text('Personal number 2: ${result.personalNumber2}'),
                  ElevatedButton(
                    child: const Text('ok'),
                    onPressed: () {
                      isParsed = false;
                      return Navigator.pop(context, true);
                    },
                  ),
                ],
              )));
    };
    controller.onError = (error) => print(error);

    controller.startPreview();
  }

  @override
  Widget build(BuildContext context) {
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
            Get.toNamed(AppRoutes.REGISTERSCANNER);
            // CnicModel cnicModel = await CnicScanner().scanCnic(imageToScan: imageToScan);
            // if (cnicModel == null) return;
            // print("NAME:::: ${_cnicModel.cnicHolderName}");
            // print("NUMBER:::: ${_cnicModel.cnicNumber}");
            // print("DOB::::: ${_cnicModel.cnicHolderDateOfBirth}");
            // print("ISSUEDATE::::: ${_cnicModel.cnicIssueDate}");
            // print("EXPIRYDATE:::: ${_cnicModel.cnicExpiryDate}");
          },
          label: 'scanNow'.tr,
        ),
      ],
    );
  }
}
