import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mensa_links/controller/auth_controller.dart';
import 'package:mensa_links/screens/auth/account_created.dart';
import 'package:mensa_links/utils/colors.dart';
import 'package:mensa_links/utils/constants.dart';
import 'package:mensa_links/widgets/custom_button.dart';
import 'package:mensa_links/widgets/custom_text_field.dart';
import 'package:mensa_links/widgets/loading.dart';
import 'package:mensa_links/widgets/simple_default_layout.dart';
import 'package:mensa_links/widgets/title_text.dart';

class ContactDetails extends StatelessWidget {
  const ContactDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDefaultScreenLayout(
      child: ContactForm(),
    );
  }
}

///Contact Form
class ContactForm extends StatelessWidget {
  final AuthController controller = Get.find<AuthController>();
  ContactForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
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
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: TitleText(
            text: 'enterContactDetail'.tr,
            size: Constants.subHeading2,
            align: TextAlign.left,
            color: AppColors.primaryColor,
          ),
        ),
        CustomTextField(
          controller: controller.mobile,
          hintText: 'mobile'.tr,
        ),
        CustomTextField(
          controller: controller.email,
          hintText: 'email'.tr,
        ),
        CustomTextField(
          controller: controller.address1,
          hintText: 'address1'.tr,
        ),
        CustomTextField(
          controller: controller.address2,
          hintText: 'address2'.tr,
        ),
        CustomTextField(
          controller: controller.poBox,
          hintText: 'poBox'.tr,
        ),
        CustomButton(
          verticalMargin: 10,
          label: 'next'.tr,
          onTap: () {
            Get.to(
              () => Loading(
                onComplete: () {
                  Future.delayed(
                    const Duration(seconds: 3),
                    () {
                      Get.to(
                        () => const AccountCreated(),
                      );
                    },
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
