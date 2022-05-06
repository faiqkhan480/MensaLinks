import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mensa_links/controller/auth_controller.dart';
import 'package:mensa_links/utils/constants.dart';
import 'package:mensa_links/widgets/custom_text_field.dart';
import 'package:mensa_links/widgets/simple_default_layout.dart';
import 'package:mensa_links/widgets/title_text.dart';

class ContactDetails extends StatelessWidget {
  final AuthController controller = Get.find<AuthController>();
  ContactDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SimpleDefaultLayout(
      child: CreateAccountForm(),
    );
  }
}

///Contact Form
class CreateAccountForm extends StatelessWidget {
  const CreateAccountForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: TitleText(
            text: 'Create Account',
            size: Constants.heading,
            color: Constants.primaryColor,
            weight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: TitleText(
            text: 'Please enter your contact details',
            size: Constants.subHeading2,
            align: TextAlign.left,
            color: Constants.primaryColor,
          ),
        ),
        CustomTextField(
          controller: TextEditingController(),
          hintText: 'Mobile Number',
        ),
        CustomTextField(
          controller: TextEditingController(),
          hintText: 'Email',
        ),
        CustomTextField(
          controller: TextEditingController(),
          hintText: 'Address Line 1',
        ),
        CustomTextField(
          controller: TextEditingController(),
          hintText: 'Address Line 2',
        ),
        CustomTextField(
          controller: TextEditingController(),
          hintText: 'P.O. Box',
        ),
      ],
    );
  }
}
