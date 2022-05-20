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
import '../../widgets/simple_default_layout.dart';

class ProcessStaffSalary extends StatelessWidget {
  const ProcessStaffSalary({Key? key}) : super(key: key);

  HomeController get _controller => Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SimpleDefaultScreenLayout(
      pageTitle: 'Process Staff Salary',
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
            onTap: () {},
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
            values: List.generate(5, (index) => (index + 1).toString(),),
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
                  hint: "year",
                  values: List.generate(
                    30,
                        (index) {
                      return (1990 + index).toString();
                    },
                  ),
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
          radioButtons(),

          if(_controller.radioSelection.value == 1)...[
            CustomTextField(
              hintText: "Personal Number",
              controller: TextEditingController(),
              contentPadding: UIStyleProperties.insetsVrt10Hzt15,
            ),
            CustomTextField(
              hintText: "Comments",
              controller: TextEditingController(),
            ),

            CustomButton(
              label: "Save & Add Next",
              // alignment: Alignment.center,
              verticalMargin: 15,
              onTap: () => null,
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

  Widget radioButtons() {
    return Padding(
      padding: UIStyleProperties.insetsVrt10,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(Constants.tabs.length, (index) => radio(index < 1 ? 1 : 2)),
      ),
    );
  }

  Widget radio(int val) {
    return InkWell(
      onTap: () => _controller.radioSelection(val),
      radius: 20,
      child: Wrap(
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              color: _controller.radioSelection.value == val ? AppColors.primaryColor : Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.slightlyGrey, width: 1.8)
            ),
            margin: EdgeInsets.only(right: 2, left: (val + 5).toDouble()),
            height: Constants.heading18,
            width: Constants.heading18,
          ),
          TitleText(
            text: Constants.tabs.elementAt(val-1),
            color: AppColors.slightlyGrey,
            size: Constants.regularText,
            weight: FontWeight.bold,
          )
        ],
      ),
    );
  }
}
