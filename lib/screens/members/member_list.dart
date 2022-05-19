import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mensa_links/routes/app_routes.dart';

import '../../utils/assets.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/screen_properties.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/name_box.dart';
import '../../widgets/simple_default_layout.dart';
import '../../widgets/text_widgets.dart';

class MemberList extends StatelessWidget {
  const MemberList({Key? key}) : super(key: key);

  get args => Get.arguments;

  void handleSubmit () {

  }

  @override
  Widget build(BuildContext context) {
    return SimpleDefaultScreenLayout(
      pageTitle: args != 'pull' ? "Edit member" : 'Manage Dependent Accounts',
      child: body(),
      bottomNavigation: bottomWidget(),
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
      onTap: () => Get.toNamed(args == "pull" ? AppRoutes.DEPENDENTCARD : AppRoutes.MEMBEREDIT, arguments: args),
      title: TitleText(
        text: "Chiao Yu Wang",
        color: AppColors.primaryColor,
        weight: FontWeight.w700,
        size: Constants.regularText,
      ),
      subtitle: TitleText(
        text: "**** **** ***6 5360",
        color: AppColors.primaryColor,
        weight: FontWeight.w700,
        size: Constants.smallText,
      ),
      leading: const NameBox(name: "MA"),
      trailing: (args == "edit") ? IconButton(
        onPressed: () => Get.toNamed(AppRoutes.DEPENDENTCARD, arguments: args),
        icon: SvgPicture.asset(Assets.bin, color: AppColors.primaryColor),
      ) : null,
    );
  }
  
  Widget bottomWidget() {
    return ColoredBox(
      color: AppColors.white,
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: [BoxShadow(
            color: AppColors.ultraDarkGrey,
            // color: Colors.black,
            spreadRadius: 0.0,
            blurRadius: 4.0
          )]
        ),

        child: CustomButton(
          label: 'Next',
          minHeight: 0.05,
          alignment: Alignment.center,
          onTap: () => Get.toNamed(AppRoutes.DEPENDENTCARD , arguments: args),
        ),
      ),
    );
  }
}
