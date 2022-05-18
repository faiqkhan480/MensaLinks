import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          CustomButton(
            verticalMargin: 30,
            label: 'Select Member',
            trailing: Assets.upArrow,
            quarterTurns: 2,
            padding: UIStyleProperties.insetsVrt20Hzt10,
            radius: 10,
            onTap: () {},
          ),

          // WidgetUtils.spaceVrt25,
          CustomButton(
            verticalMargin: 40,
            label: 'Purpose',
            trailing: Assets.upArrow,
            quarterTurns: 2,
            padding: UIStyleProperties.insetsVrt20Hzt10,
            radius: 10,
            onTap: () {},
          ),

          WidgetUtils.spaceVrt25,

          Padding(
            padding: UIStyleProperties.insetsVrt20,
            child: Row(
              children: const [
                Expanded(flex: 3, child: ScreenTitle(text: 'Amount',)),
                // WidgetUtils.spaceHzt10,
                Expanded(flex: 5, child: TextDropdownField(flexField: 4, flexDropdown: 3,)),
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
            onTap: () => Get.toNamed(AppRoutes.PIN, arguments: "transfer"),
          ),
        ],
      ),
    );
  }
}