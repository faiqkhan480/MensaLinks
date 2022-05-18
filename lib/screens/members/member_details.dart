import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mensa_links/utils/colors.dart';
import 'package:mensa_links/utils/widget_util.dart';

import '../../utils/constants.dart';
import '../../utils/screen_properties.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/simple_default_layout.dart';
import '../../widgets/text_widgets.dart';

class MemberDetails extends StatelessWidget {
  const MemberDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDefaultScreenLayout(
      pageTitle: 'Create Account For Family',
      padding: UIStyleProperties.insetsVrt5Hzt10,
      child: body(),
    );
  }

  Widget body() {
    return Container(
        padding: UIStyleProperties.insetsVrt25,
        // physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SeparatorText("Download & Review Member Details"),

            CustomButton(
              label: 'Download',
              alignment: Alignment.center,
              verticalMargin: 50,
              minWidth: 0.4,
              minHeight: 0.02,
              onTap: () => null,
            ),

            WidgetUtils.spaceVrt25,

            const SeparatorText("Or"),

            WidgetUtils.spaceVrt25,
            const CustomTable()
          ],
        )
    );
  }
}


class CustomTable extends StatelessWidget {
  const CustomTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        tableHeader()
      ],
    );
  }

  Widget tableHeader() {
    return Container(
      decoration: UIStyleProperties.roundedRadiusDecoration(backgroundColor: AppColors.primaryColor, radius: 10),
      // height: 30,
      // padding: UIStyleProperties.insetsVrt15Hzt15,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: Get.width * 0.070),
      // width: double.infinity,
      child: Row(
        children: List.generate(Constants.tableHeaders.length, (index) => Expanded(
          child: Text(
              Constants.tableHeaders.elementAt(index),
            maxLines: 1,
            style: TextStyle(
              color: AppColors.white,
              fontSize: Constants.extraSmallText,
              fontWeight: FontWeight.w500
            ),
          ),
          // child: TitleText(
            //   text: Constants.tableHeaders.elementAt(index),
            //   size: Constants.extraSmallText,
            //   color: AppColors.white,
            //   weight: FontWeight.w500,
            // )
        ),),
      ),
    );
  }

  Widget tableBody() {
    return Container();
  }
}
