import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mensa_links/models/id_card.dart';

import '../../controller/auth_controller.dart';
import '../../routes/app_routes.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_dropdown.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/simple_default_layout.dart';
import '../../widgets/text_widgets.dart';
import '../../utils/screen_properties.dart';
import '../../utils/widget_util.dart';

class RegisterDetails extends StatelessWidget {
  const RegisterDetails({Key? key}) : super(key: key);

  AuthController get _controller => Get.find<AuthController>();

  // IdCard? get args => IdCard.fromMap(Get.arguments);

  final emiratesIDFormat = "###-####-######-#";
  @override
  Widget build(BuildContext context) {
    return SimpleDefaultScreenLayout(
      pageTitle: 'createAccount',
      pageTitleSize: Constants.pageTitle,
      child: Obx(body),
    );
  }

  Widget body() {
    print(_controller.expiryDate.value);
    return SingleChildScrollView(
      physics: Constants.scrollPhysics,
      padding: UIStyleProperties.insetsVrt8Hzt20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // WidgetUtils.spaceVrt25,
          ScreenTitle(text: "personalDetails", size: Constants.heading18),
          CustomTextField(
            readOnly: _controller.isReadOnly(),
            label: 'fullName'.tr,
            filled: _controller.isReadOnly(),
            labelColor: AppColors.slightlyGrey,
            labelVerticalPadding: UIStyleProperties.insetsVrt8,
            labelSize: Constants.heading18,
            controller: _controller.fullName,
          ),
          CustomTextField(
            readOnly: _controller.isReadOnly(),
            filled: _controller.isReadOnly(),
            label: 'iDNumber'.tr,
            labelColor: AppColors.slightlyGrey,
            labelVerticalPadding: UIStyleProperties.insetsVrt8,
            labelSize: Constants.heading18,
            controller: _controller.idNumber,
            keyboardType: TextInputType.number,
            marginTop: 0,
            inputFormatters: [MaskTextInputFormatter(mask: emiratesIDFormat)],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomDropdown(
                  readOnly: _controller.isReadOnly(),
                  filled: _controller.isReadOnly(),
                  label: 'iDExpiry'.tr,
                  hint: 'day'.tr,
                  values: List.generate(31, (index) {return (index + 1).toString().padLeft(2, "0");},),
                  onValueSelected: (String? item) {
                    // log('Selected Date: $item');
                    // _controller.expiryDate.value = item;
                  },
                  selectedValue: _controller.expiryDate.value,
                ),
              ),
              WidgetUtils.spaceHzt5,
              Expanded(
                child: CustomDropdown(
                  readOnly: _controller.isReadOnly(),
                  filled: _controller.isReadOnly(),
                  label: '',
                  hint: 'month'.tr,
                  values: _controller.months,
                  onValueSelected: (String? item) {
                    // log('Selected Month: $item');
                    // _controller.expiryMonth.value = item;
                  },
                  selectedValue: _controller.expiryMonth.value,
                ),
              ),
              WidgetUtils.spaceHzt5,
              Expanded(
                child: CustomDropdown(
                  readOnly: _controller.isReadOnly(),
                  filled: _controller.isReadOnly(),
                  label: '',
                  hint: 'year'.tr,
                  values: Constants.expiryYears,
                  onValueSelected: (String? item) {
                    // log('Selected Year: $item');
                    _controller.expiryYear.value = item!;
                  },
                  selectedValue: _controller.expiryYear.value,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, top: 20),
            child: TitleText(
              text: "dob",
              color: AppColors.primaryColor.withOpacity(0.5),
              weight: FontWeight.bold,
              size: Constants.heading18,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomDropdown(
                  readOnly: _controller.isReadOnly(),
                  filled: _controller.isReadOnly(),
                  hint: 'day'.tr,
                  values: List.generate(31, (index) => (index + 1).toString().padLeft(2, "0"),
                  ),
                  onValueSelected: (String? item) {
                    log('Selected Date: $item');
                    _controller.birthDate.value = item!;
                  },
                  selectedValue: _controller.birthDate.value,
                ),
              ),
              WidgetUtils.spaceHzt5,
              Expanded(
                child: CustomDropdown(
                  readOnly: _controller.isReadOnly(),
                  filled: _controller.isReadOnly(),
                  hint: 'month'.tr,
                  values: _controller.months,
                  onValueSelected: (String? item) {
                    log('Selected Month: $item');
                    _controller.birthMonth.value = item!;
                  },
                  selectedValue: _controller.birthMonth.value,
                ),
              ),
              WidgetUtils.spaceHzt5,
              Expanded(
                child: CustomDropdown(
                  readOnly: _controller.isReadOnly(),
                  filled: _controller.isReadOnly(),
                  hint: 'year'.tr,
                  values: Constants.listOfYears,
                  onValueSelected: (String? item) {
                    _controller.birthYear.value = item!;
                  },
                  selectedValue: _controller.birthYear.value,
                ),
              ),
            ],
          ),
          WidgetUtils.spaceVrt25,
          CustomButton(
            label: 'next'.tr,
            // alignment: Alignment.center,
            verticalMargin: 45,
            onTap: () => Get.toNamed(AppRoutes.CONTACTDETAIL),
          ),

          TextButton(
            onPressed: () => _controller.handleEditForm(false),
            child: const Text(' Edit Info '),
            style: TextButton.styleFrom(
                primary: AppColors.darkGrey,
                textStyle: TextStyle(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                    fontSize: Constants.heading18
                )),
          )
        ],
      ),
    );
  }
}
