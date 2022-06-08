import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mensa_links/controller/member_controller.dart';
import 'package:mensa_links/widgets/name_box.dart';

import '../../utils/assets.dart';
import '../../utils/constants.dart';
import '../../utils/screen_properties.dart';
import '../../utils/widget_util.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_dropdown.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/done_screen.dart';
import '../../widgets/simple_default_layout.dart';
import '../../widgets/text_widgets.dart';

class DependentCard extends StatelessWidget {
  const DependentCard({Key? key}) : super(key: key);

  get args => Get.arguments;

  void handleSubmit() {
    Get.off(const DoneScreen(message: "Requested Submitted"));
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDefaultScreenLayout(
      pageTitle: args == "pull" ? 'Pull Back Money From' : 'Cancel Dependent Card',
      child: Obx(body),
    );
  }

  Widget body() {
    final MemberController controller = Get.find<MemberController>();

    bool _pull = args == "pull";
    return SingleChildScrollView(
      padding: UIStyleProperties.insetsVrt8Hzt20,
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SeparatorText(_pull ? "Personal Details" : "Card Details",),
          // ScreenTitle(text: _pull ? "Personal Details" : "Card Details", size: Constants.heading18),
          WidgetUtils.spaceVrt10,
          const Align(alignment: Alignment.centerLeft, child: NameBox(name: 'CW')),
          WidgetUtils.spaceVrt20,
          infoRow("NAME", "Chiao Yu Wang"),
          if(!_pull)...[
            infoRow("Card", "**** * ****"),
            infoRow("Info 2", "**** * ****"),
          ]
          else
            WidgetUtils.spaceVrt20,
          infoRow("Mobile", "+971 50 550 5505"),
          if(controller.pullBack())...[
            WidgetUtils.spaceVrt20,
            infoRow("Amount", "100.00 AED"),
            WidgetUtils.spaceVrt20,
            infoRow("Reason", "Bonus reversed"),
          ],

          if(!controller.pullBack())...[
            if(_pull)
              Padding(
              padding: UIStyleProperties.insetsVrt20,
              child: Row(
                children:  [
                  Expanded(flex: 3, child: ScreenTitle(text: 'Amount', size: Constants.heading20,)),
                  // WidgetUtils.spaceHzt10,
                  const Expanded(flex: 4, child: TextDropdownField(flexField: 3, flexDropdown: 2,)),
                ],
              ),
            ),

            if(!_pull)
              WidgetUtils.spaceVrt20,
            CustomDropdown(
              hint: "Reasons",
              invert: true,
              fontSize: Constants.heading18,
              values: ["Transfer someone else", "Mistakenly transfer"],
              onValueSelected: (String? item) {},
              // contentPadding: UIStyleProperties.insetsVrt20Hzt10,
              // selectedValue: controller.birthYear.value,
            ),
          ],

          WidgetUtils.spaceVrt20,
          ScreenTitle(text: "Comments", size: Constants.heading20),
          CustomTextField(
            hintText: 'Enter your comments',
            controller: TextEditingController(),
            lines: 5,
          ),

          WidgetUtils.spaceVrt35,
          CustomButton(
            label: !_pull ?
            'Cancel Card' :
            _pull && controller.pullBack() ?
            'Confirm' :
            'Pull Back Money',
            onTap: !_pull ?
            handleSubmit :
            _pull && controller.pullBack() ?
            controller.confirmPullRequest :
            controller.submitPullBackRequest,
          ),
        ],
      ),
    );
  }

  Widget infoRow(String label, String text) => Padding(
    padding: const EdgeInsets.all(6.0),
    child: TitleText(
      text: "$label\t\t\t\t\t\t\t\t\t\t\t\t:\t\t$text",
      weight: FontWeight.w500,
      size: Constants.regularText,
    ),
  );
}
