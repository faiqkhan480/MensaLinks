import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mensa_links/controller/register_controller.dart';
import 'package:mensa_links/utils/constants.dart';
import 'package:mensa_links/utils/size_config.dart';
import 'package:mensa_links/widgets/custom_text_field.dart';
import 'package:mensa_links/widgets/title_text.dart';

class RegisterDetails extends StatelessWidget {
  final RegisterController controller;
  const RegisterDetails({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                        topRight: Radius.circular(
                          Constants.radius,
                        ),
                        topLeft: Radius.circular(
                          Constants.radius,
                        ),
                      ),
                    ),
                    child: SingleChildScrollView(
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
                            alignment: Alignment.centerLeft,
                            child: TitleText(
                              text: 'Personal Details',
                              size: Constants.subHeading2,
                              align: TextAlign.left,
                              color: Constants.primaryColor,
                            ),
                          ),
                          CustomTextField(
                            label: 'Full Name',
                            controller: TextEditingController(),
                          ),
                          CustomTextField(
                            label: 'ID Number',
                            controller: TextEditingController(),
                          ),
                          Obx(
                            () => Container(
                              child: CustomDropdownButton2(
                                // buttonWidth: k,
                                value: controller.selectedDate.value,
                                hint: 'Select Day',
                                buttonHeight: 60,
                                dropdownItems: List.generate(
                                  30,
                                  (index) {
                                    return index.toString();
                                  },
                                ),
                                onChanged: (String? item) {
                                  controller.selectedDate.value = item;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
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
