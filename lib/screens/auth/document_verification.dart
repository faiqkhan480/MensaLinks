import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/screen_properties.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/loading.dart';
import '../../widgets/simple_default_layout.dart';
import '../../widgets/title_text.dart';

class DocumentVerification extends StatelessWidget {
  const DocumentVerification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDefaultScreenLayout(
      child: body(),
    );
  }

  Widget body() {
    return ListView(
      children: [
        Center(
          child: TitleText(
            text: 'document_verification',
            size: Constants.heading,
            color: AppColors.primaryColor,
            weight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: TitleText(
            text: 'plz_upload_document',
            size: Constants.subHeading2,
            align: TextAlign.left,
            color: AppColors.primaryColor,
          ),
        ),
        CustomButton(
          verticalMargin: 10,
          label: 'passport',
          trailing: "assets/images/up-arrow.png",
          padding: UIStyleProperties.insetsVrt20Hzt10,
          radius: 10,
          onTap: () {},
        ),
        CustomButton(
          verticalMargin: 30,
          label: 'visa',
          trailing: "assets/images/up-arrow.png",
          padding: UIStyleProperties.insetsVrt20Hzt10,
          radius: 10,
          onTap: () {},
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40, bottom: 10, left: 20, right: 20),
          child: TitleText(
            text: 'doc_verification_msg',
            size: Constants.smallText,
            align: TextAlign.center,
            color: AppColors.primaryColor,
          ),
        ),
        CustomButton(
          verticalMargin: 10,
          label: 'done',
          onTap: () {
            Get.to(
              () => Loading(
                onComplete: () {
                  Future.delayed(
                    const Duration(seconds: 3),
                    () => Get.toNamed(AppRoutes.ACCOUNTCREATED),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
