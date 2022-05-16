import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../utils/assets.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/screen_properties.dart';
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
      leading: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10)
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        // padding: UIStyleProperties.insets10,
        child: TitleText(
          text: "MA",
          color: AppColors.white,
          weight: FontWeight.w700,
          size: Constants.heading20,
        ),
      ),
      trailing: IconButton(
        onPressed: () => null,
        icon: SvgPicture.asset(Assets.bin, color: AppColors.primaryColor),
      ),
    );
  }
}
