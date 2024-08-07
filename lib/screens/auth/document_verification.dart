import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mensa_links/utils/assets.dart';

import '../../controller/home_controller.dart';
import '../../routes/app_routes.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/screen_properties.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/loading.dart';
import '../../widgets/simple_default_layout.dart';
import '../../widgets/text_widgets.dart';

class DocumentVerification extends StatefulWidget {
  const DocumentVerification({Key? key}) : super(key: key);

  @override
  State<DocumentVerification> createState() => _DocumentVerificationState();
}

class _DocumentVerificationState extends State<DocumentVerification> {
  get args => Get.arguments;
  final ImagePicker _picker = ImagePicker();
  File? _image;
  final GetStorage _box = GetStorage();

  void handleDone() {
    if(args['type'] == "for_worker") {
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
      Get.toNamed(AppRoutes.MEMBERSDETAILS, arguments: args['type']);
    }
  }

  Future uploadImage() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);

    if(image != null){
      setState(() {
        _image = image as File;
      });
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
    bool businessLogin = _box.read("loginType") == "business";
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Padding(
          padding: UIStyleProperties.insetsVrt8Hzt20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // padding: UIStyleProperties.insetsVrt8Hzt20,
            // physics: Constants.scrollPhysics,
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
              if(!isFromHome)
                Spacer(),
              CustomButton(
                verticalMargin: 10,
                label: isFromHome ?
                "Emirates ID" :
                businessLogin ?
                "Trade License" :
                "passport",
                trailing:  Assets.upArrow,
                padding: UIStyleProperties.insetsVrt20Hzt10,
                radius: 10,
                alignment: Alignment.center,
                onTap: uploadImage,
              ),

              if(!isFromHome)...[
                CustomButton(
                  verticalMargin: 30,
                  label: businessLogin ?
                  "VAT Reg Certificate" :
                  "visa",
                  trailing: Assets.upArrow,
                  padding: UIStyleProperties.insetsVrt20Hzt10,
                  radius: 10,
                  onTap: uploadImage,
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 10, left: 20, right: 20),
                  child: TitleText(
                    text: 'doc_verification_msg',
                    size: Constants.smallText,
                    align: TextAlign.center,
                    color: AppColors.primaryColor,
                  ),
                ),
                Spacer(),
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
                Spacer(flex: 3,),
              ],
            ]
          ),
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
