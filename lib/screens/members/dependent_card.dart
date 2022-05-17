import 'package:flutter/material.dart';
import 'package:mensa_links/widgets/name_box.dart';

import '../../utils/assets.dart';
import '../../utils/constants.dart';
import '../../utils/screen_properties.dart';
import '../../utils/widget_util.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/simple_default_layout.dart';
import '../../widgets/title_text.dart';

class DependentCard extends StatelessWidget {
  const DependentCard({Key? key}) : super(key: key);

  void handleSubmit() {

  }

  @override
  Widget build(BuildContext context) {
    return SimpleDefaultScreenLayout(
      pageTitle: 'Cancel Dependent Card',
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
          ScreenTitle(text: "Card Details", size: Constants.heading18),
          WidgetUtils.spaceVrt40,
          const Align(alignment: Alignment.centerLeft, child: NameBox(name: 'CW')),
          WidgetUtils.spaceVrt35,
          infoRow("NAME", "Chiao Yu Wang"),
          infoRow("Card", "**** * ****"),
          infoRow("Info 2", "**** * ****"),
          infoRow("Mobile", "+971 50 550 5505"),

          WidgetUtils.spaceVrt20,
          CustomButton(
            label: 'Reasons',
            trailing: Assets.upArrow,
            quarterTurns: 2,
            onTap: handleSubmit,
          ),

          WidgetUtils.spaceVrt20,
          ScreenTitle(text: "Comments", size: Constants.heading20),
          CustomTextField(
            hintText: 'Enter your comments',
            controller: TextEditingController(),
            lines: 5,
          ),

          WidgetUtils.spaceVrt35,
          CustomButton(
            label: 'Cancel Card',
            // alignment: Alignment.center,
            onTap: handleSubmit,
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
      size: Constants.heading18,
    ),
  );
}
