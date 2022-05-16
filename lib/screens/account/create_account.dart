import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';
import '../../utils/screen_properties.dart';
import '../../utils/widget_util.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_dropdown.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/simple_default_layout.dart';
import '../../widgets/title_text.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var args = Get.arguments;

    return SimpleDefaultScreenLayout(
      pageTitle: args,
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: ScreenTitle(text: 'Personal Details', size: Constants.heading18),
          ),
          WidgetUtils.spaceVrt10,

          CustomTextField(
            hintText: 'Nick Name',
            controller: TextEditingController(),
          ),
          WidgetUtils.spaceVrt20,
          CustomTextField(
            hintText: 'First Name',
            controller: TextEditingController(),
          ),
          WidgetUtils.spaceVrt20,
          CustomTextField(
            hintText: 'Last Name',
            controller: TextEditingController(),
          ),
          WidgetUtils.spaceVrt20,
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(child: CustomTextField(
                hintText: 'ID Number',
                controller: TextEditingController(),
              )),
              WidgetUtils.spaceHzt10,
              Expanded(child: DropdownMenuField(values: Constants.months, value: 'Emirates ID',)),
            ],
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: ScreenTitle(text: 'ID Expiry Date', size: Constants.heading18),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomDropdown(
                  hint: 'day',
                  width: Get.width * 0.25,
                  values: Constants.months,
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
                  values: List.generate(
                    31,
                        (index) {
                      return (index + 1).toString();
                    },
                  ),
                  onValueSelected: (String? item) {},
                ),
              ),
              WidgetUtils.spaceHzt5,
              Expanded(
                child: CustomDropdown(
                  hint: 'year',
                  width: Get.width * 0.25,
                  values: List.generate(
                    30,
                        (index) {
                      return (1990 + index).toString();
                    },
                  ),
                  onValueSelected: (String? item) {
                    // log('Selected Year: $item');
                    // controller.birthYear.value = item;
                  },
                  // selectedValue: controller.birthYear.value,
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: ScreenTitle(text: 'Date Of Birth', size: Constants.heading18),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomDropdown(
                  hint: 'day',
                  width: Get.width * 0.25,
                  values: Constants.months,
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
                  values: List.generate(
                    31,
                        (index) {
                      return (index + 1).toString();
                    },
                  ),
                  onValueSelected: (String? item) {},
                ),
              ),
              WidgetUtils.spaceHzt5,
              Expanded(
                child: CustomDropdown(
                  hint: 'year',
                  width: Get.width * 0.25,
                  values: List.generate(
                    30,
                        (index) {
                      return (1990 + index).toString();
                    },
                  ),
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
            label: 'Next',
            // alignment: Alignment.center,
            verticalMargin: 15,
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}