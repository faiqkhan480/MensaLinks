import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mensa_links/utils/constants.dart';
import 'package:mensa_links/widgets/custom_dropdown.dart';

import '../../routes/app_routes.dart';
import '../../utils/assets.dart';
import '../../utils/screen_properties.dart';
import '../../utils/widget_util.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/simple_default_layout.dart';
import '../../widgets/text_widgets.dart';

class TransferMoney extends StatelessWidget {
  const TransferMoney({Key? key}) : super(key: key);

  void handleNavigate() {
    Get.toNamed(AppRoutes.PIN, arguments: "transfer");
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDefaultScreenLayout(
      pageTitle: 'Transfer Money To Family',
      padding: UIStyleProperties.insetsVrt8Hzt30,
      child: body(),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          WidgetUtils.spaceVrt40,
          CustomDropdown(
            hint: "Select Member",
            invert: true,
            fontSize: Constants.heading18,
            values: List.generate(Constants.members.length, (index) => Constants.members.elementAt(index),),
            onValueSelected: (String? item) {},
            contentPadding: UIStyleProperties.insetsVrt20Hzt10,
            // selectedValue: controller.birthYear.value,
          ),

          WidgetUtils.spaceVrt40,
          CustomDropdown(
            hint: "Purpose",
            invert: true,
            fontSize: Constants.heading18,
            values: List.generate(Constants.purposes.length, (index) => Constants.purposes.elementAt(index),),
            onValueSelected: (String? item) {},
            contentPadding: UIStyleProperties.insetsVrt20Hzt10,
            // selectedValue: controller.birthYear.value,
          ),

          WidgetUtils.spaceVrt25,

          Padding(
            padding: UIStyleProperties.insetsVrt20,
            child: Row(
              children: const [
                Expanded(flex: 3, child: ScreenTitle(text: 'Amount',)),
                // WidgetUtils.spaceHzt10,
                Expanded(flex: 5, child: TextDropdownField(flexField: 4, flexDropdown: 2,)),
              ],
            ),
          ),

          const Padding(
            padding: UIStyleProperties.insetsVrt20,
            child: ScreenTitle(text: 'Comments',),
          ),

          CustomTextField(
            // label: '',
            hintText: 'Enter Your Comments',
            controller: TextEditingController(),
            lines: 8,
          ),

          CustomButton(
            label: 'Done',
            // alignment: Alignment.center,
            verticalMargin: 15,
            onTap: handleNavigate,
          ),
        ],
      ),
    );
  }
}