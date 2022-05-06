import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mensa_links/controller/auth_controller.dart';
import 'package:mensa_links/screens/auth/register_details.dart';
import 'package:mensa_links/utils/constants.dart';
import 'package:mensa_links/utils/size_config.dart';
import 'package:mensa_links/widgets/custom_button.dart';
import 'package:mensa_links/widgets/title_text.dart';

class Register extends StatelessWidget {
  final controller = Get.put(AuthController());
  Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
            color: Constants.primaryColor,
          ),
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Image.asset('assets/images/mini_logo.png'),
                  ),
                ),
                Expanded(
                  flex: 9,
                  child: Container(
                    width: SizeConfig.screenWidth,
                    decoration: BoxDecoration(
                      color: Constants.backgroundColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          Constants.radius,
                        ),
                        topRight: Radius.circular(
                          Constants.radius,
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            top: 20,
                            left: 10,
                            right: 10,
                          ),
                          child: TitleText(
                            text: 'Create Account',
                            size: Constants.heading,
                            color: Constants.primaryColor,
                            weight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            top: 20,
                            left: 10,
                            right: 10,
                          ),
                          child: TitleText(
                            text: 'Please Scan Your Valid Emirates ID',
                            size: Constants.subHeading,
                            align: TextAlign.center,
                            color: Constants.primaryColor,
                            weight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            top: 20,
                            left: 10,
                            right: 10,
                          ),
                          child: TitleText(
                            text:
                                'UAE Central Bank requires us to obtain copy and information of your valid Emirates ID',
                            align: TextAlign.center,
                            color: Constants.primaryColor,
                          ),
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                        CustomButton(
                          onTap: () async {
                            // await controller.onScanNow();
                            Get.to(
                              () => RegisterDetails(controller: controller),
                            );
                          },
                          label: 'Scan Now',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
