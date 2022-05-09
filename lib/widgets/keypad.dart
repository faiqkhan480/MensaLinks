import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mensa_links/utils/colors.dart';

import '../controller/auth_controller.dart';

class CustomPinKeyboard extends StatelessWidget {
  final Function delete;
  final Function? onSubmit;
  final AuthController? controller;

  const CustomPinKeyboard({Key? key, required this.delete, this.onSubmit, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30),
      padding: const EdgeInsets.only(bottom: 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            numberButton(
              number: 1,
              //    size: buttonSize,
              //   color: buttonColor,
            ),
            numberButton(
              number: 2,
              //     size: buttonSize,
              //     color: buttonColor,
            ),
            numberButton(
              number: 3,
              //  size: buttonSize,
              //   color: buttonColor,
            ),
          ],
        ),
            const SizedBox(height: 10),
            Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            numberButton(
              number: 4,
              //   size: buttonSize,
              //  color: buttonColor,
            ),
            numberButton(
              number: 5,
              //   size: buttonSize,
              //   color: buttonColor,
            ),
            numberButton(
              number: 6,
              //  size: buttonSize,
              //     color: buttonColor,
            ),
          ],
        ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            numberButton(
              number: 7,
              //     size: buttonSize,
              //   color: buttonColor,
            ),
            numberButton(
              number: 8,
              //      size: buttonSize,
              //   color: buttonColor,
            ),
            numberButton(
              number: 9,
              //     size: buttonSize,
              //   color: buttonColor,
            ),
          ],
        ),
            const SizedBox(height: 10),
            Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // this button is used to delete the last number
            const SizedBox(
              width: 50,
            ),

            numberButton(
              number: 0,
              // size: buttonSize,
              // color: buttonColor,
            ),
            // this button is used to submit the entered value
            IconButton(
              onPressed: () => delete(),
              icon: const Icon(
                Icons.backspace_outlined,
                //        color: iconColor,
                color: AppColors.primaryColor,
              ),
              // iconSize: buttonSize,
            ),
          ],
        ),
      ]),
    );
  }

  Widget numberButton({required int number}) {
    return SizedBox(
      child: TextButton(
          child: Text(
            number.toString(),
            style: const TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.w400),
          ),
          onPressed: () => controller!.handleChange(number.toString())),
    );
  }
}
