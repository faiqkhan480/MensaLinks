import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mensa_links/controller/home_controller.dart';
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

class ProcessSalary extends StatelessWidget {
  const ProcessSalary({Key? key}) : super(key: key);

  HomeController get _controller => Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    var args = Get.arguments;

    return SimpleDefaultScreenLayout(
      pageTitle: "Process Salary for Domestic Worker",
      padding: UIStyleProperties.insetsVrt10Hzt25,
      child: Obx(body),
    );
  }

  Widget body() {
    bool wps = _controller.selectedTab.value == 0;
    return SingleChildScrollView(
      padding: UIStyleProperties.insetsVrt8Hzt10,
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          WidgetUtils.spaceVrt25,
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

          const SeparatorText('Enter Salary', isDense: false),

          const TextDropdownField(hintText: 'Salary Amount',),

          const SeparatorText('Select Salary Month', isDense: false),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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


          // IF WPS TRUE
          if(wps)...[
            const SeparatorText('Enter Personal Number', isDense: false),
            CustomTextField(
              hintText: 'Personal Number',
              marginTop: 0.0,
              controller: TextEditingController(),
              // lines: 5,
            ),
          ],

          const SeparatorText('Enter Comments', isDense: false),

          CustomTextField(
            marginTop: 0.0,
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
        borderRadius: BorderRadius.circular(12)
    ),
    height: Get.height * 0.05,
    margin: const EdgeInsets.symmetric(horizontal: 50),
    padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
    child: Row(
      children: List.generate(2, (index) => Expanded(
        child: CustomButton(
          label: index < 1 ? 'WPS' : 'NonWPS',
          invert: _controller.selectedTab.value == index,
          verticalMargin: 0,
          fontSize: Constants.smallText,
          alignment: Alignment.center,
          radius: 10,
          onTap: () => _controller.handleTab(index),
        ),
      )),
    ),
  );
}

