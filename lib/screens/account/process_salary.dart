import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mensa_links/utils/assets.dart';
import 'package:mensa_links/utils/colors.dart';
import 'package:mensa_links/utils/constants.dart';

import '../../utils/screen_properties.dart';
import '../../utils/widget_util.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_dropdown.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/simple_default_layout.dart';
import '../../widgets/text_widgets.dart';

class ProcessSalary extends StatefulWidget {
  const ProcessSalary({Key? key}) : super(key: key);

  @override
  State<ProcessSalary> createState() => _ProcessSalaryState();
}

class _ProcessSalaryState extends State<ProcessSalary> {
  bool wps = true;

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
          WidgetUtils.spaceVrt10,
          customTabBar(),
          WidgetUtils.spaceVrt10,

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
            padding: UIStyleProperties.insetsHzt20,
            child: ScreenTitle(text: 'Enter Salary', size: Constants.subHeading),
          ),
          const TextDropdownField(hintText: 'Salary Amount',),

          Padding(
            padding: UIStyleProperties.insetsHzt20,
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

          // IF WPS TRUE
          if(wps)...[
            Padding(
              padding: UIStyleProperties.insetsHzt20,
              child: ScreenTitle(text: 'Enter Personal Number', size: Constants.subHeading),
            ),
            CustomTextField(
              // label: '',
              hintText: 'Personal Number',
              controller: TextEditingController(),
              // lines: 5,
            ),
          ],

          Padding(
            padding: UIStyleProperties.insetsHzt20,
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

  Widget customTabBar() => Container(
    decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(18)
    ),
    height: Get.height * 0.07,
    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
    child: Row(
      children: [
        Expanded(
          child: CustomButton(
            label: 'WPS',
            invert: wps,
            verticalMargin: 0,
            // alignment: Alignment.center,
            // verticalMargin: 15,
            onTap: () => setState(() => wps = true),
          ),
        ),
        Expanded(
          child: CustomButton(
            label: 'NonWPS',
            invert: !wps,
            // alignment: Alignment.center,
            // verticalMargin: 15,
            onTap: () => setState(() => wps = false),
          ),
        ),
      ],
    ),
  );
}

