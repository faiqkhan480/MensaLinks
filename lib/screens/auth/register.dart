import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mensa_links/controller/auth_controller.dart';
import 'package:mensa_links/routes/app_routes.dart';
import 'package:mensa_links/utils/assets.dart';
import 'package:mensa_links/utils/colors.dart';
import 'package:mensa_links/utils/constants.dart';
import 'package:mensa_links/utils/size_config.dart';
import 'package:mensa_links/widgets/custom_button.dart';
import 'package:mensa_links/widgets/simple_default_layout.dart';
import 'package:mensa_links/widgets/text_widgets.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);

  final AuthController controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return SimpleDefaultScreenLayout(
      pageTitle: "createAccount",
      pageTitleSize: 0.060,
      showAppBarBackButton: true,
      child: _body(
      ),
    );
  }

  Widget _body() {
    return ListView(
      physics: Constants.scrollPhysics,
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 20,
            left: 10,
            right: 10,
          ),
          child: TitleText(
            text: 'scanID'.tr,
            size: Constants.subHeading,
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
            // await controller.onScanNow();
            Get.toNamed(AppRoutes.REGISTERSCANNER);
          },
          label: 'scanNow'.tr,
        ),
      ],
    );
  }
}
