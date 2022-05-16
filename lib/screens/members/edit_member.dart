import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/assets.dart';
import '../../utils/constants.dart';
import '../../utils/screen_properties.dart';
import '../../utils/widget_util.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_dropdown.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/simple_default_layout.dart';
import '../../widgets/title_text.dart';

class EditMember extends StatelessWidget {
  const EditMember({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDefaultScreenLayout(
      pageTitle: 'Edit Member Details',
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
          CustomTextField(
            hintText: 'Contact Details',
            controller: TextEditingController(),
          ),
          CustomTextField(
            // label: '',
            hintText: 'First Name',
            controller: TextEditingController(),
            // lines: 5,
          ),
          CustomTextField(
            // label: '',
            hintText: 'Last Name',
            controller: TextEditingController(),
            // lines: 5,
          ),


          // ID EXPIRY DATE SELECTION
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: ScreenTitle(text: 'ID Expiry Date', size: Constants.subHeading),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WidgetUtils.spaceHzt5,
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
                  onValueSelected: (String? item) {},
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

          // DATE OF BIRTH SELECTION
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: ScreenTitle(text: 'Date Of Birth', size: Constants.subHeading),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WidgetUtils.spaceHzt5,
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
                  onValueSelected: (String? item) {},
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
            label: 'Process Salary',
            // alignment: Alignment.center,
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
