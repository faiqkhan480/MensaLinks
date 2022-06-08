import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mensa_links/controller/home_controller.dart';
import 'package:mensa_links/routes/app_routes.dart';
import 'package:mensa_links/utils/colors.dart';
import 'package:mensa_links/utils/constants.dart';
import 'package:mensa_links/utils/widget_util.dart';
import 'package:mensa_links/widgets/custom_button.dart';
import 'package:mensa_links/widgets/text_widgets.dart';

import '../../utils/assets.dart';
import '../../utils/screen_properties.dart';
import '../../widgets/custom_dropdown.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/radio_buttons.dart';
import '../../widgets/simple_default_layout.dart';

class ProcessStaffSalary extends StatelessWidget {
  const ProcessStaffSalary({Key? key}) : super(key: key);

  HomeController get _controller => Get.find<HomeController>();

  void handleBack() {
    // if(_controller.salaryProcessed()) {
      // _controller.setValues();
      _controller.setRadioValue(0);
    // } else {
      Get.back();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDefaultScreenLayout(
      pageTitle: 'Process Staff Salary',
      handleBack: handleBack,
      child: Obx(body),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      padding: UIStyleProperties.insetsVrt8Hzt20,
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SeparatorText("Upload Payroll Excel"),

          CustomButton(
            verticalMargin: 10,
            label: '',
            trailing: Assets.upArrow,
            invert: true,
            bordered: true,
            radius: Constants.textFieldRadius,
            minHeight: 0.06,
            onTap: _controller.uploadImage,
          ),
          WidgetUtils.spaceVrt5,
          TitleText(
            text: 'Download Template',
            size: Constants.smallText,
            weight: FontWeight.w500,
            align: TextAlign.end,
            color: AppColors.greyScale,
          ),

          const Center(child: SeparatorText("Or")),

          CustomDropdown(
            hint: "Select Staff",
            values: List.generate(Constants.members.length, (index) => Constants.members.elementAt(index),),
            onValueSelected: (String? item) {},
            invert: true,
          ),
          WidgetUtils.spaceVrt20,
          // DATE SELECTION
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomDropdown(
                  hint: "Salary Month",
                  values: Constants.months,
                  onValueSelected: (String? item) {},
                ),
              ),
              WidgetUtils.spaceHzt5,
              Expanded(
                child: CustomDropdown(
                  hint: "year",
                  values: Constants.listOfYears,
                  onValueSelected: (String? item) {},
                  // selectedValue: controller.birthYear.value,
                ),
              ),
            ],
          ),

          WidgetUtils.spaceVrt20,
          const TextDropdownField(hintText: 'Salary Amount',),

          // RADIO BUTTONS
          WidgetUtils.spaceVrt10,
          RadioButtons(controller: _controller),

          if(_controller.radioSelection.value > 0)...[
            if(_controller.radioSelection.value == 1)
              CustomTextField(
              hintText: "Personal Number",
              controller: TextEditingController(),
              contentPadding: UIStyleProperties.insetsVrt10Hzt15,
            ),

            CustomTextField(
              hintText: "Comments",
              lines: _controller.radioSelection.value,
              controller: TextEditingController(),
            ),
          ],
          if(_controller.radioSelection.value > 0)...[
            CustomButton(
              label: "Save & Add Next",
              // alignment: Alignment.center,
              verticalMargin: 15,
              onTap: _controller.handleConfirmStaffSalary,
            ),
            CustomButton(
              label: "Process Salary",
              // alignment: Alignment.center,
              verticalMargin: 15,
              onTap: () =>  Get.toNamed(AppRoutes.PROCESSSALRY, arguments: "from_staff"),
            ),
          ],
        ],
      ),
    );
  }
}
