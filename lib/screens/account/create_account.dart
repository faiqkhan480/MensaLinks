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
    bool forWorker = args == "for_worker";
    bool forStaff = args == "for_staff";
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
            hintText: controller.familyFormSubmitted() ? "Mobile Number" : (forStaff ? "Staff ID" : "Nick Name"),
            controller: TextEditingController(),
          ),
          WidgetUtils.spaceVrt20,
          CustomTextField(
            hintText: controller.familyFormSubmitted() ? "Email" : "First Name",
            controller: TextEditingController(),
          ),
          WidgetUtils.spaceVrt20,
          CustomTextField(
            hintText: controller.familyFormSubmitted() ? "Address Line 1" : "Last Name",
            controller: TextEditingController(),
          ),
          WidgetUtils.spaceVrt20,
          if(controller.familyFormSubmitted())...[
            CustomTextField(
              hintText: "Address Line 2",
              controller: TextEditingController(),
            ),
            WidgetUtils.spaceVrt20,
            CustomTextField(
              hintText: "PO Box",
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
                      hintText: "ID Number",
                      controller: TextEditingController(),
                )),
                WidgetUtils.spaceHzt10,
                Expanded(flex: 4, child: DropdownMenuField(values: ['Emirates ID', "National ID"], value: controller.emiratesId.value, onValueSelected: controller.handleEmiratesID)),
              ],
            ),

            // EXPIRY DATE DROPDOWNS
            const SeparatorText("ID Expiry Date"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomDropdown(
                    hint: "day",
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
                    hint: "month",
                    values: Constants.months,
                    onValueSelected: (String? item) {},
                  ),
                ),
                WidgetUtils.spaceHzt5,
                Expanded(
                  child: CustomDropdown(
                    hint: "year",
                    values: Constants.expiryYears,
                    onValueSelected: (String? item) {},
                    // selectedValue: controller.birthYear.value,
                  ),
                ),
              ],
            ),

            // DATE OF BIRTH SELECTIONS DROPDOWNS
            const SeparatorText("dob"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomDropdown(
                    hint: "day",
                    values: List.generate(31, (index) =>  (index + 1).toString(),),
                    onValueSelected: (String? item) {
                    },
                    // selectedValue: controller.birthDate.value,
                  ),
                ),
                WidgetUtils.spaceHzt5,
                Expanded(
                  child: CustomDropdown(
                    hint: "month",
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
          ],

          if(controller.familyFormSubmitted())
            WidgetUtils.spaceVrt40
          else
            WidgetUtils.spaceVrt20,
          if(controller.familyFormSubmitted())
            CustomButton(
            label: "Save & Add Next",
            // alignment: Alignment.center,
            verticalMargin: 15,
            onTap: () => controller.handleFamilyForm(false),
          ),
          CustomButton(
            label: controller.familyFormSubmitted() ? "finish" : "next",
            // alignment: Alignment.center,
            verticalMargin: 15,
            onTap: () =>  controller.familyFormSubmitted() ? controller.toVerifyDoc(args) : controller.handleFamilyForm(true),
          ),
        ],
      ),
    );
  }
}