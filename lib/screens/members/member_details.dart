import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';
import '../../utils/screen_properties.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_table.dart';
import '../../widgets/done_screen.dart';
import '../../widgets/loading.dart';
import '../../widgets/simple_default_layout.dart';
import '../../widgets/text_widgets.dart';

class MemberDetails extends StatelessWidget {
  const MemberDetails({Key? key}) : super(key: key);

  get args => Get.arguments;
  bool get forStaff => args == "for_staff";
  bool get payRoll => args == "payRoll";

  void handleClick() {
    if(payRoll) {
      Get.find<HomeController>().setRadioValue(0);
      Get.off(const DoneScreen(message: "Salary Process Request Submitted", counts: 3,));
    }
    else {
      Get.off(() =>
          Loading(
              waveLoading: false,
              msgBefore: (forStaff) ? "Card Request Submitted Successfully!" : "Request Submitted Successfully",
              msgAfter: 'KYC Verification in Progress. We will let you know once completed.',
              onComplete: () => null,
              onDone: () {
                if(Get.isRegistered<HomeController>()){
                  Get.find<HomeController>().handleFamilyForm(false);
                  Get.close(3);
                }
              })
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDefaultScreenLayout(
      pageTitle: payRoll ? "Process Staff Salary" : args,
      padding: UIStyleProperties.insetsVrt5Hzt10,
      child: body(),
    );
  }

  Widget body() {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Column(
          children: [
            SeparatorText(
                (forStaff) ?
                "Download & Review Staff Details" :
                (payRoll) ?
                "Download & Review Payroll Excel" :
                "Download & Review Member Details"
            ),

            CustomButton(
              label: 'Download',
              alignment: Alignment.center,
              verticalMargin: 20,
              minWidth: 0.3,
              minHeight: 0.02,
              onTap: () => null,
            ),

            // WidgetUtils.spaceVrt25,

            const SeparatorText("Or"),

            // WidgetUtils.spaceVrt25,
            CustomTable(isPayRoll: payRoll,)
          ],
        ),

        Positioned(
          bottom: 20,
          child: CustomButton(
            verticalMargin: 10,
            minWidth: 0.40,
            minHeight: 0.06,
            radius: 20,
            label: payRoll ? "Process Salary" : "confirm",
            onTap: handleClick,
          ),
        ),
      ],
    );
  }
}
