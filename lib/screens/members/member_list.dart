import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mensa_links/routes/app_routes.dart';

import '../../utils/assets.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/screen_properties.dart';
import '../../widgets/name_box.dart';
import '../../widgets/simple_default_layout.dart';
import '../../widgets/title_text.dart';

class MemberList extends StatelessWidget {
  const MemberList({Key? key}) : super(key: key);

  get args => Get.arguments;

  @override
  Widget build(BuildContext context) {
    return SimpleDefaultScreenLayout(
      pageTitle: args != 'pull' ? "Edit member" : 'Manage Dependent Accounts',
      child: body(),
    );
  }

  Widget body() {
    return ListView.builder(
      padding: UIStyleProperties.topInsets20,
      physics: Constants.scrollPhysics,
      itemCount: 10,
      itemBuilder: (context, index) => memberTitle(),
    );
  }

  Widget memberTitle() {
    return ListTile(
      onTap: () => Get.toNamed(AppRoutes.MEMBEREDIT),
      title: TitleText(
        text: "Chiao Yu Wang",
        color: AppColors.primaryColor,
        weight: FontWeight.w500,
        size: Constants.heading18,
      ),
      subtitle: TitleText(
        text: "**** **** ***6 5360",
        color: AppColors.primaryColor,
        weight: FontWeight.w500,
        size: Constants.regularText,
      ),
      leading: NameBox(name: "MA"),
      trailing: IconButton(
        onPressed: () => Get.toNamed(AppRoutes.DEPENDENTCARD),
        icon: SvgPicture.asset(Assets.bin, color: AppColors.primaryColor),
      ),
    );
  }
}
