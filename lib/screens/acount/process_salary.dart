import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mensa_links/utils/assets.dart';
import 'package:mensa_links/utils/constants.dart';

import '../../utils/screen_properties.dart';
import '../../utils/widget_util.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_dropdown.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/simple_default_layout.dart';
import '../../widgets/title_text.dart';

class ProcessSalary extends StatelessWidget {
  const ProcessSalary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var args = Get.arguments;

    return SimpleDefaultScreenLayout(
      pageTitle: "Process Salary for Domestic Worker",
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
          CustomButton(
            verticalMargin: 30,
            label: 'Select Worker',
            trailing: Assets.upArrow,
            quarterTurns: 2,
            padding: UIStyleProperties.insetsVrt20Hzt10,
            radius: 10,
            onTap: () {},
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: ScreenTitle(text: 'Enter Salary', size: Constants.subHeading),
          ),
          const TextDropdownField(hintText: 'Salary Amount',),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: ScreenTitle(text: 'Select Salary Month', size: Constants.subHeading)
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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

          WidgetUtils.spaceVrt10,

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: ScreenTitle(text: 'Enter Personal Number', size: Constants.subHeading),
          ),
          CustomTextField(
            // label: '',
            hintText: 'Personal Number',
            controller: TextEditingController(),
            // lines: 5,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: ScreenTitle(text: 'Enter Comments', size: Constants.subHeading),
          ),

          CustomTextField(
            // label: '',
            hintText: 'Comments..',
            controller: TextEditingController(),
            lines: 2,
          ),

          WidgetUtils.spaceVrt20,

          CustomButton(
            label: 'Process Salary',
            alignment: Alignment.center,
            // verticalMargin: 15,
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
