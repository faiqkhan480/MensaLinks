import 'package:flutter/material.dart';
import 'package:mensa_links/utils/widget_util.dart';

import '../../utils/screen_properties.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/simple_default_layout.dart';
import '../../widgets/title_text.dart';

class ManageAccount extends StatelessWidget {
  const ManageAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDefaultScreenLayout(
      child: body(),
    );
  }

  Widget body() {
    return Column(
      children: [
        const ScreenTitle(text: 'Manage Dependent Accounts',),
        const Spacer(),
        CustomButton(
          label: 'Edit Member Details',
          // alignment: Alignment.center,
          verticalMargin: 15,
          onTap: () => null,
        ),
        WidgetUtils.spaceVrt25,
        CustomButton(
          label: 'Pull Back Money',
          // alignment: Alignment.center,
          verticalMargin: 15,
          onTap: () => null,
        ),
        const Spacer(),
      ],
    );
  }
}
