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

  void handleClick() {
    Get.off(() =>
        Loading(
          waveLoading: false,
          msgBefore: 'Request Submitted Successfully',
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

  @override
  Widget build(BuildContext context) {
    return SimpleDefaultScreenLayout(
      pageTitle: 'Create Account For Family',
      padding: UIStyleProperties.insetsVrt5Hzt10,
      child: body(),
    );
  }

  Widget body() {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
            // padding: UIStyleProperties.insetsVrt10,
            // physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SeparatorText("Download & Review Member Details"),

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
                const CustomTable()
              ],
            )
        ),

        Positioned(
          bottom: 20,
          child: CustomButton(
            verticalMargin: 10,
            label: 'done',
            onTap: handleClick,
          ),
        ),
      ],
    );
  }
}
