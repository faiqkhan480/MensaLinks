import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mensa_links/utils/assets.dart';

import '../../controller/home_controller.dart';
import '../../utils/constants.dart';
import '../../utils/screen_properties.dart';
import '../../utils/widget_util.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_dropdown.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/simple_default_layout.dart';
import '../../widgets/text_widgets.dart';

class RegisterPayment extends StatelessWidget {
  const RegisterPayment({Key? key}) : super(key: key);

  HomeController get _controller => Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SimpleDefaultScreenLayout(
      pageTitle: 'Register Payment',
      child: body(),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      padding: UIStyleProperties.insetsVrt8Hzt20,
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // AMOUNT DEPOSITED SECTION
          separatorText("Amount Deposited"),
          const TextDropdownField(hintText: "Amount Deposited"),

          WidgetUtils.spaceVrt20,

          // DATE SELECTIONS
          separatorText('Date',),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomDropdown(
                  hint: 'day',
                  width: Get.width * 0.25,
                  values: List.generate(
                    31,
                        (index) {
                      return (index + 1).toString();
                    },
                  ),
                  onValueSelected: (String? item) {
                    // log('Selected Date: $item');
                    // controller.birthDate.value = item;
                  },
                  // selectedValue: controller.birthDate.value,
                ),
              ),
              WidgetUtils.spaceHzt5,
              Expanded(
                child: CustomDropdown(
                  hint: 'month',
                  width: Get.width * 0.25,
                  values: Constants.months,
                  onValueSelected: (String? item) {},
                ),
              ),
              WidgetUtils.spaceHzt5,
              Expanded(
                child: CustomDropdown(
                  hint: 'year',
                  width: Get.width * 0.25,
                  values: Constants.listOfYears,
                  onValueSelected: (String? item) {
                    // log('Selected Year: $item');
                    // controller.birthYear.value = item;
                  },
                  // selectedValue: controller.birthYear.value,
                ),
              ),
            ],
          ),

          WidgetUtils.spaceVrt20,

          CustomButton(
            verticalMargin: 30,
            label: 'Upload Reciept',
            trailing: Assets.upArrow,
            minHeight: 0.06,
            radius: 10,
            onTap: _controller.uploadImage,
          ),

          WidgetUtils.spaceVrt25,

          separatorText('Comments',),

          CustomTextField(
            // label: '',
            hintText: 'Enter Your Comments',
            controller: TextEditingController(),
            lines: 5,
          ),

          CustomButton(
            label: 'Done',
            // alignment: Alignment.center,
            verticalMargin: 15,
            onTap: _controller.handleRegisterPayment,
          ),
        ],
      ),
    );
  }

  Widget separatorText(String text) => Padding(
    padding: UIStyleProperties.insetsVrt15,
    child: TitleText(
      text: text,
      weight: FontWeight.bold,
      size: Constants.heading20,
    ),
  );
}
