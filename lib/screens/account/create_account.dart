import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mensa_links/controller/home_controller.dart';

import '../../utils/constants.dart';
import '../../utils/screen_properties.dart';
import '../../utils/widget_util.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_dropdown.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/simple_default_layout.dart';
import '../../widgets/text_widgets.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({Key? key}) : super(key: key);

  HomeController get controller => Get.find<HomeController>();
  get args => Get.arguments;

  @override
  Widget build(BuildContext context) {

    return SimpleDefaultScreenLayout(
      pageTitle: args,
        handleBack: () => (controller.familyFormSubmitted()) ? controller.handleFamilyForm(false) : Get.back(),
        child: Obx(body),
    );
  }

  Widget body() {
    bool forWorker = args == 'for_worker';
    return SingleChildScrollView(
      padding: UIStyleProperties.insetsVrt8Hzt20,
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // AMOUNT DEPOSITED SECTION
          SeparatorText(controller.familyFormSubmitted() ? 'Contact Details' : 'Personal Details'),
          // WidgetUtils.spaceVrt10,

          CustomTextField(
            hintText: controller.familyFormSubmitted() ? 'Mobile Number' : 'Nick Name',
            controller: TextEditingController(),
          ),
          WidgetUtils.spaceVrt20,
          CustomTextField(
            hintText: controller.familyFormSubmitted() ? 'Email' : 'First Name',
            controller: TextEditingController(),
          ),
          WidgetUtils.spaceVrt20,
          CustomTextField(
            hintText: controller.familyFormSubmitted() ? 'Address Line 1' : 'Last Name',
            controller: TextEditingController(),
          ),
          WidgetUtils.spaceVrt20,
          if(controller.familyFormSubmitted())...[
            CustomTextField(
              hintText: 'Address Line 2',
              controller: TextEditingController(),
            ),
            WidgetUtils.spaceVrt20,
            CustomTextField(
              hintText: 'PO Box',
              controller: TextEditingController(),
            ),
          ]
          else...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                    flex: 5,
                    child: CustomTextField(
                      hintText: 'ID Number',
                      controller: TextEditingController(),
                )),
                WidgetUtils.spaceHzt10,
                Expanded(flex: 4, child: DropdownMenuField(values: Constants.months, value: 'Emirates ID',)),
              ],
            ),

            const SeparatorText('ID Expiry Date'),
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

            const SeparatorText('dob'),
            // Padding(
            //   padding: UIStyleProperties.insetsVrt20,
            //   child: ScreenTitle(text: 'Date Of Birth', size: Constants.heading18),
            // ),
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
          ],

          WidgetUtils.spaceVrt20,
          if(controller.familyFormSubmitted())
            CustomButton(
            label: 'Save & Add Next',
            // alignment: Alignment.center,
            verticalMargin: 15,
            onTap: () => controller.handleFamilyForm(false),
          ),
          CustomButton(
            label: controller.familyFormSubmitted() ? 'finish' : 'next',
            // alignment: Alignment.center,
            verticalMargin: 15,
            onTap: () =>  controller.familyFormSubmitted() ? controller.toVerifyDoc(forWorker) : controller.handleFamilyForm(true),
          ),
        ],
      ),
    );
  }
}