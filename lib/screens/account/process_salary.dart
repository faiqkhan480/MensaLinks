import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mensa_links/controller/home_controller.dart';
import 'package:mensa_links/routes/app_routes.dart';
import 'package:mensa_links/utils/assets.dart';
import 'package:mensa_links/utils/colors.dart';
import 'package:mensa_links/utils/constants.dart';

import '../../utils/screen_properties.dart';
import '../../utils/widget_util.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_dropdown.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/radio_buttons.dart';
import '../../widgets/simple_default_layout.dart';
import '../../widgets/text_widgets.dart';

class ProcessSalary extends StatelessWidget {
  const ProcessSalary({Key? key}) : super(key: key);

  HomeController get _controller => Get.find<HomeController>();
  get _args => Get.arguments;

  void handleBack() {
    if(_controller.salaryProcessed()) {
      _controller.setValues();
      // _controller.handleProcessSalary(false);
    } else {
      _controller.setValues();
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    bool forStaff = _args == "from_staff";
    return SimpleDefaultScreenLayout(
      pageTitle: forStaff ? "Process Staff Salary" : "Process Salary for Domestic Worker",
      padding: UIStyleProperties.insetsVrt10Hzt25,
      handleBack: handleBack,
      child: Obx(body),
    );
  }

  Widget body() {
    bool wps = _controller.selectedTab.value == 0;
    bool forStaff = _args == "from_staff";
    return SingleChildScrollView(
      padding: UIStyleProperties.insetsVrt8Hzt10,
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if(_controller.salaryProcessed())
            CustomTextField(
              hintText: "Worker Name",
              label: forStaff ? "Staff" : "Worker",
              controller: TextEditingController(),
            )
          else...[
            WidgetUtils.spaceVrt25,
            if(!_controller.isSave())...[
              customTabBar(),
              WidgetUtils.spaceVrt10,
            ]
            else
              RadioButtons(controller: _controller),

            WidgetUtils.spaceVrt25,
            CustomDropdown(
              hint: forStaff ? "Select Staff" : "Select Worker",
              invert: true,
              fontSize: Constants.heading18,
              values: List.generate(Constants.members.length, (index) => Constants.members.elementAt(index),),
              onValueSelected: (String? item) {},
              contentPadding: UIStyleProperties.insetsVrt20Hzt10,
              // selectedValue: controller.birthYear.value,
            ),
          ],

          separatorText(_controller.salaryProcessed() ? (forStaff ? 'Staff' : 'Salary Amount') : 'Enter Salary'),

          const TextDropdownField(hintText: 'Salary Amount',),


          separatorText(_controller.salaryProcessed() ? 'Salary Month' : 'Select Salary Month'  ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
                  values: Constants.paymentYears,
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
          if(wps && _controller.radioSelection < 2)
            CustomTextField(
              label: _controller.salaryProcessed() ? 'Personal Number' : 'Enter Personal Number',
              hintText: 'Personal Number',
              marginTop: 0.0,
              controller: TextEditingController(),
              // lines: 5,
            ),

          CustomTextField(
            label: _controller.salaryProcessed() ? 'Comments' : 'Enter Comments',
            marginTop: 0.0,
            hintText: 'Comments..',
            controller: TextEditingController(),
            lines: 2,
          ),

          WidgetUtils.spaceVrt20,

          if(_controller.isSave())
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  label: "Process Salary",
                  alignment: Alignment.center,
                  minHeight: 0.010,
                  minWidth: 0.40,
                  onTap: () => Get.toNamed(AppRoutes.MEMBERSDETAILS, arguments: "payRoll"),
                ),
                CustomButton(
                  label: "Save & Next",
                  // alignment: Alignment.center,
                  minHeight: 0.020,
                  minWidth: 0.40,
                  onTap: () => null,
                ),
              ],
            )
          else
            CustomButton(
            label: _controller.salaryProcessed() ? 'Confirm' : 'Process Salary',
            alignment: Alignment.center,
            // verticalMargin: 15,
            onTap: () => _controller.salaryProcessed() ? (
                forStaff && _controller.isSave() ?
                _controller.handleConfirmStaffSalary() :
                _controller.handleConfirm()) :
            _controller.handleProcessSalary(true),
          ),
        ],
      ),
    );
  }

  Widget separatorText(String text) => Padding(
    padding: UIStyleProperties.insetsVrt15,
    child: TitleText(
      text: text,
      color: AppColors.primaryColor,
      weight: FontWeight.bold,
      size: Constants.heading20,
    ),
  );

  Widget customTabBar() => Container(
    decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(12)
    ),
    height: Get.height * 0.05,
    margin: const EdgeInsets.symmetric(horizontal: 50),
    padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
    child: LayoutBuilder(
      builder: (context, size) {
        return Row(
          children: List.generate(2, (index) => Expanded(
            child: CustomButton(
              label: index < 1 ? 'WPS' : 'NonWPS',
              invert: _controller.selectedTab.value == index,
              verticalMargin: 0,
              padding: EdgeInsets.zero,
              fontSize: size.maxHeight * 0.50,
              // fontSize: Constants.smallText,
              alignment: Alignment.center,
              radius: 10,
              onTap: () => _controller.handleTab(index),
            ),
          )),
        );
      }
    ),
  );
}

