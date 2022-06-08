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
import '../../widgets/text_widgets.dart';

class EditMember extends StatelessWidget {
  const EditMember({Key? key}) : super(key: key);

  void handleSubmit() {
    Get.off(const DoneScreen(message: "Member Details Updated!"));
  }

  MemberController get controller => Get.find<MemberController>();
  get args => Get.arguments;

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
          inputField(
              hint1: 'Nick Name',
              hint2: 'Mobile Number',
              textController1: controller.nickName,
              textController2: controller.mobile,
          ),
          WidgetUtils.spaceVrt20,
          inputField(
            hint1: 'First Name',
            hint2: 'Email',
            textController1: controller.firstName,
            textController2: controller.email,
          ),
          WidgetUtils.spaceVrt20,
          inputField(
            hint1: 'Last Name',
            hint2: 'Address Line 1',
            textController1: controller.lastname,
            textController2: controller.address1,
          ),
          WidgetUtils.spaceVrt20,
          if(controller.contactDetail())...[
            CustomTextField(
              hintText: 'Address Line 2',
              controller: controller.address2,
              filled: true,
              editIcon: true,
            ),
            WidgetUtils.spaceVrt20,
            CustomTextField(
              hintText: 'PO B.O.X',
              filled: true,
              editIcon: true,
              controller: controller.poBox,
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
                    controller: controller.idNum,
                    // lines: 5,
                  ),
                ),
                WidgetUtils.spaceHzt10,
                Expanded(child: DropdownMenuField(values: ['Emirates ID', "National ID"], value: controller.emiratesId.value, onValueSelected: controller.handleEmiratesID,)),
              ],
            ),
            // ID EXPIRY DATE SELECTION
            sectionTitle('ID Expiry Date'),
            dateSelection(controller.expiryDate, controller.expiryMonth, controller.expiryYear),

            // DATE OF BIRTH SELECTION
            sectionTitle('Date Of Birth'),
            dateSelection(controller.birthDate, controller.birthMonth, controller.birthYear),
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
    height: Get.height * 0.080,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () => controller.changeTab(false),
          child: TitleText(
            text: 'Personal Details',
            size: Constants.regularText,
            weight: FontWeight.w700,
            color: !controller.contactDetail() ? AppColors.primaryColor : AppColors.ultraDarkGrey,
          ),
        ),
        const Padding(
          padding: UIStyleProperties.insetsVrt25,
          child: VerticalDivider(thickness: 1.5, color: AppColors.primaryColor,),
        ),
        InkWell(
          onTap: () => controller.changeTab(true),
          child: TitleText(
            text: 'Contact Details',
            size: Constants.regularText,
            color: controller.contactDetail() ? AppColors.primaryColor : AppColors.ultraDarkGrey,
            weight: FontWeight.w700,
          ),
        )
      ],
    ),
  );

  Widget sectionTitle(String title) => Padding(
    padding: UIStyleProperties.insetsVrt20,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ScreenTitle(text: title, size: Constants.subHeading),
        const Icon(Icons.edit_rounded, color: AppColors.primaryColor),
      ],
    ),
  );

  Widget inputField(
      {
    required String hint1,
    required String hint2,
    required TextEditingController textController1,
    required TextEditingController textController2,
  }) => CustomTextField(
    hintText: !controller.contactDetail() ? hint1 : hint2,
    controller: !controller.contactDetail() ? textController1 : textController2,
    filled: true,
    editIcon: true,
  );

  Widget dateSelection(String day, String month, String year) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      WidgetUtils.spaceHzt5,
      Expanded(
        child: CustomDropdown(
            hint: 'day',
          selectedValue: day,
          values: List.generate(
              31,
                  (index) {
                return (index + 1).toString();
              },
            ),
            onValueSelected: (String? item) {},
            filled: true,
        ),
      ),
      WidgetUtils.spaceHzt5,
      Expanded(
        child: CustomDropdown(
          hint: 'month',
          selectedValue: month,
          filled: true,
          values: Constants.months,
          onValueSelected: (String? item) {},
        ),
      ),
      WidgetUtils.spaceHzt5,
      Expanded(
        child: CustomDropdown(
          hint: 'year',
          selectedValue: year,
          filled: true,
          values: Constants.listOfYears,
          onValueSelected: (String? item) {},
          // selectedValue: controller.birthYear.value,
        ),
      ),
    ],
  );
}
