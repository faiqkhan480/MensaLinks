import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mensa_links/routes/app_routes.dart';
import 'package:mensa_links/utils/widget_util.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/simple_default_layout.dart';

class ManageAccount extends StatelessWidget {
  const ManageAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDefaultScreenLayout(
      pageTitle: 'Manage Dependent Accounts',
      child: body(),
    );
  }

  Widget body() {
    return Column(
      children: [
        const Spacer(),
        CustomButton(
          label: 'Edit Member Details',
          // alignment: Alignment.center,
          verticalMargin: 15,
          onTap: () => Get.toNamed(AppRoutes.MEMBERS, arguments: "edit"),
        ),
        WidgetUtils.spaceVrt25,
        CustomButton(
          label: 'Pull Back Money',
          // alignment: Alignment.center,
          verticalMargin: 15,
          onTap: () => Get.toNamed(AppRoutes.MEMBERS, arguments: "pull"),
        ),
        const Spacer(),
      ],
    );
  }
}
