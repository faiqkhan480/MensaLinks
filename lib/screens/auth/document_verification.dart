import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mensa_links/utils/assets.dart';

import '../../controller/home_controller.dart';
import '../../routes/app_routes.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/screen_properties.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/done_screen.dart';
import '../../widgets/loading.dart';
import '../../widgets/simple_default_layout.dart';
import '../../widgets/text_widgets.dart';

class DocumentVerification extends StatelessWidget {
  const DocumentVerification({Key? key}) : super(key: key);

  get args => Get.arguments;

  void handleDone() {
    if(args['forWorker']) {
      Get.off(() =>
          Loading(
            waveLoading: false,
            msgBefore: 'Request Submitted Successfully',
            msgAfter: 'KYC Verification in Progress. We will let you know once completed.',
            onComplete: () => null,
            onDone: () {
              if(Get.isRegistered<HomeController>()){
                Get.find<HomeController>().handleFamilyForm(false);
                Get.close(2);
              }
            },
          ),
      );
    } else {
      Get.toNamed(AppRoutes.MEMBERSDETAILS);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDefaultScreenLayout(
      pageTitle: 'document_verification',
      pageTitleSize: Constants.pageTitle,
      child: body(),
    );
  }

  Widget body() {
    bool isFromHome = args != null;
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        ListView(
          padding: UIStyleProperties.insetsVrt8Hzt20,
          physics: Constants.scrollPhysics,
          children: [
            Padding(
              padding: UIStyleProperties.insetsVrt20,
              child: TitleText(
                text: isFromHome ? 'Please upload valid emirates ID of the member' : 'plz_upload_document',
                size: isFromHome ? Constants.regularText : Constants.heading18,
                align: isFromHome ? TextAlign.center : TextAlign.left,
                color: AppColors.primaryColor,
              ),
            ),
            CustomButton(
              verticalMargin: 10,
              label: isFromHome ? 'Emirates ID' : 'passport',
              trailing:  Assets.upArrow,
              padding: UIStyleProperties.insetsVrt20Hzt10,
              radius: 10,
              alignment: Alignment.center,
              onTap: () {},
            ),

            if(!isFromHome)...[
              CustomButton(
                verticalMargin: 30,
                label: 'visa',
                trailing: Assets.upArrow,
                padding: UIStyleProperties.insetsVrt20Hzt10,
                radius: 10,
                onTap: () {},
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 10, left: 20, right: 20),
                child: TitleText(
                  text: 'doc_verification_msg',
                  size: Constants.smallText,
                  align: TextAlign.center,
                  color: AppColors.primaryColor,
                ),
              ),
              CustomButton(
                verticalMargin: 10,
                label: 'done',
                onTap: () {
                  Get.off(() =>
                      Loading(
                      msgBefore: "",
                      onComplete: () {
                        Future.delayed(
                          const Duration(seconds: 3),
                              () => Get.toNamed(AppRoutes.ACCOUNTCREATED),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ],
        ),

        if(isFromHome)
          Positioned(
            bottom: 20,
            child: CustomButton(
            verticalMargin: 10,
            label: 'done',
            onTap: handleDone,
        ),
          ),
      ],
    );
  }
}
