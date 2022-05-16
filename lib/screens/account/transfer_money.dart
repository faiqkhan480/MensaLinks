import 'package:flutter/material.dart';

import '../../utils/screen_properties.dart';
import '../../utils/widget_util.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/simple_default_layout.dart';
import '../../widgets/title_text.dart';

class TransferMoney extends StatelessWidget {
  const TransferMoney({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDefaultScreenLayout(
      pageTitle: 'Transfer Money To Family',
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
          CustomButton(
            verticalMargin: 30,
            label: 'Select Member',
            trailing: "assets/images/up-arrow.png",
            padding: UIStyleProperties.insetsVrt20Hzt10,
            radius: 10,
            onTap: () {},
          ),

          WidgetUtils.spaceVrt25,
          CustomButton(
            verticalMargin: 30,
            label: 'Purpose',
            trailing: "assets/images/up-arrow.png",
            padding: UIStyleProperties.insetsVrt20Hzt10,
            radius: 10,
            onTap: () {},
          ),

          WidgetUtils.spaceVrt25,

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              children: const [
                Expanded(flex: 3, child: ScreenTitle(text: 'Amount',)),
                // WidgetUtils.spaceHzt10,
                Expanded(flex: 4, child: TextDropdownField(flexField: 3, flexDropdown: 2,)),
              ],
            ),
          ),

          WidgetUtils.spaceVrt10,

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: ScreenTitle(text: 'Comments',),
          ),

          CustomTextField(
            // label: '',
            hintText: 'Enter Your Comments',
            controller: TextEditingController(),
            lines: 5,
          ),

          CustomButton(
            label: 'Done',
            // alignment: Alignment.center,
            verticalMargin: 15,
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}