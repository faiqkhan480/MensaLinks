import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mensa_links/controller/auth_controller.dart';
import 'package:mensa_links/routes/app_routes.dart';
import 'package:mensa_links/screens/auth/account_created.dart';
import 'package:mensa_links/utils/colors.dart';
import 'package:mensa_links/utils/constants.dart';
import 'package:mensa_links/utils/widget_util.dart';
import 'package:mensa_links/widgets/custom_button.dart';
import 'package:mensa_links/widgets/custom_text_field.dart';
import 'package:mensa_links/widgets/loading.dart';
import 'package:mensa_links/widgets/simple_default_layout.dart';
import 'package:mensa_links/widgets/text_widgets.dart';

import '../../utils/screen_properties.dart';

class ContactDetails extends StatelessWidget {
  ContactDetails({Key? key}) : super(key: key);

  AuthController get controller => Get.find<AuthController>();
  final GetStorage _box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return SimpleDefaultScreenLayout(
      child: _body(),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      physics: Constants.scrollPhysics,
      padding: UIStyleProperties.insetsVrt8Hzt20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: TitleText(
              text: 'createAccount'.tr,
              size: Constants.heading,
              color: AppColors.primaryColor,
              weight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: UIStyleProperties.insetsVrt20,
            child: TitleText(
              text: 'enterContactDetail'.tr,
              size: Constants.heading18,
              align: TextAlign.left,
              weight: FontWeight.bold,
            ),
          ),
          CustomTextField(
            controller: controller.mobile,
            hintText: 'mobile'.tr,
          ),
          WidgetUtils.spaceVrt15,
          CustomTextField(
            controller: controller.email,
            hintText: 'email'.tr,
          ),
          WidgetUtils.spaceVrt15,
          CustomTextField(
            controller: controller.address1,
            hintText: 'address1'.tr,
          ),
          WidgetUtils.spaceVrt15,
          CustomTextField(
            controller: controller.address2,
            hintText: 'address2'.tr,
          ),
          WidgetUtils.spaceVrt15,
          CustomTextField(
            controller: controller.poBox,
            hintText: 'poBox'.tr,
          ),
          WidgetUtils.spaceVrt15,
          CustomButton(
            verticalMargin: 10,
            label: 'next',
            onTap: () {
              bool businessLogin = _box.read("loginType") == "business";
              if(!businessLogin) {
                Get.off(() =>
                    Loading(
                      msgBefore: "",
                      onComplete: () {
                        Future.delayed(
                          const Duration(seconds: 3),
                              () => Get.toNamed(AppRoutes.ACCOUNTCREATED),
                        );
                      },
                    ),
                );
              }
              else {
                Get.toNamed(AppRoutes.DOCUMENTVERIFICATION);
              }
              // Get.to(
              //   () => Loading(
              //     onComplete: () {
              //       Future.delayed(
              //         const Duration(seconds: 3),
              //         () => Get.toNamed(AppRoutes.DOCUMENTVERIFICATION),
              //       );
              //     },
              //   ),
              // );
            },
          ),
        ],
      ),
    );
  }
}
