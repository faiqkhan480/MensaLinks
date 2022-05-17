import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mensa_links/utils/colors.dart';
import 'package:mensa_links/widgets/done_screen.dart';

import '../../controller/member_controller.dart';
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

  void handleSubmit() {
    Get.off(const DoneScreen(message: "Member Details Updated!"));
  }

  MemberController get controller => Get.find<MemberController>();

  @override
  Widget build(BuildContext context) {
    return SimpleDefaultScreenLayout(
      pageTitle: 'Edit Member Details',
      pageSubtitle: Obx(customTab),
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
          CustomTextField(
            hintText: controller.contactDetail() ? 'Mobile Number' : 'Contact Details',
            controller: TextEditingController(),
            filled: true,
            editIcon: true,
          ),
          WidgetUtils.spaceVrt20,
          CustomTextField(
            hintText: controller.contactDetail() ? 'Email' : 'First Name',
            controller: TextEditingController(),
            filled: true,
            editIcon: true,
          ),
          WidgetUtils.spaceVrt20,
          CustomTextField(
            hintText: controller.contactDetail() ? 'Address Line 1' : 'Last Name',
            filled: true,
            editIcon: true,
            controller: TextEditingController(),
            // lines: 5,
          ),
          WidgetUtils.spaceVrt20,
          if(controller.contactDetail())...[
            CustomTextField(
              hintText: 'Address Line 2',
              controller: TextEditingController(),
              filled: true,
              editIcon: true,
            ),
            WidgetUtils.spaceVrt20,
            CustomTextField(
              hintText: 'PO B.O.X',
              filled: true,
              editIcon: true,
              controller: TextEditingController(),
              // lines: 5,
            ),
          ]
          else...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: CustomTextField(
                    hintText: 'ID Number',
                    filled: true,
                    editIcon: true,
                    controller: TextEditingController(),
                    // lines: 5,
                  ),
                ),
                WidgetUtils.spaceHzt10,
                Expanded(child: DropdownMenuField(values: Constants.months, value: 'Emirates ID',)),
              ],
            ),
            // ID EXPIRY DATE SELECTION
            sectionTitle('ID Expiry Date'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WidgetUtils.spaceHzt5,
                Expanded(
                  child: CustomDropdown(
                    hint: 'day',
                    filled: true,
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
                    filled: true,
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
                    filled: true,
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
            sectionTitle('Date Of Birth'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WidgetUtils.spaceHzt5,
                Expanded(
                  child: CustomDropdown(
                      hint: 'day',
                      values: List.generate(
                        31,
                            (index) {
                          return (index + 1).toString();
                        },
                      ),
                      onValueSelected: (String? item) {},
                      filled: true
                  ),
                ),
                WidgetUtils.spaceHzt5,
                Expanded(
                  child: CustomDropdown(
                    hint: 'month',
                    filled: true,
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
                    filled: true,
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
          ],

          WidgetUtils.spaceVrt20,
          WidgetUtils.spaceVrt20,
          CustomButton(
            label: 'done',
            // alignment: Alignment.center,
            onTap: handleSubmit,
          ),
        ],
      ),
    );
  }

  Widget customTab() => SizedBox(
    height: Get.height * 0.040,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () => controller.changeTab(false),
          child: TitleText(
            text: 'Personal Details',
            size: Constants.heading18,
            weight: FontWeight.w500,
            color: !controller.contactDetail() ? AppColors.primaryColor : AppColors.ultraDarkGrey,
          ),
        ),
        const VerticalDivider(thickness: 1.5, color: AppColors.primaryColor,),
        InkWell(
          onTap: () => controller.changeTab(true),
          child: TitleText(
            text: 'Contact Details',
            size: Constants.heading18,
            color: controller.contactDetail() ? AppColors.primaryColor : AppColors.ultraDarkGrey,
            weight: FontWeight.w500,
          ),
        )
      ],
    ),
  );

  Widget sectionTitle(String title) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ScreenTitle(text: title, size: Constants.subHeading),
        const Icon(Icons.edit_rounded, color: AppColors.primaryColor),
      ],
    ),
  );
}
