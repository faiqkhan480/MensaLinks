import 'package:flutter/material.dart';

import '../controller/pin_controller.dart';
import '../utils/colors.dart';

class CustomPinKeyboard extends StatelessWidget {
  final Function delete;
  final Function? onSubmit;
  final PinController? controller;
  final Function(String?)? onKeyPress;
  const CustomPinKeyboard(
      {Key? key,
      required this.delete,
      this.onKeyPress,
      this.onSubmit,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30),
      padding: const EdgeInsets.only(bottom: 100),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            numberButton(number: 1, onKeyPress: onKeyPress
                //    size: buttonSize,
                //   color: buttonColor,
                ),
            numberButton(number: 2, onKeyPress: onKeyPress
                //     size: buttonSize,
                //     color: buttonColor,
                ),
            numberButton(number: 3, onKeyPress: onKeyPress
                //  size: buttonSize,
                //   color: buttonColor,
                ),
          ],
        ),
        // const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            numberButton(number: 4, onKeyPress: onKeyPress
                //   size: buttonSize,
                //  color: buttonColor,
                ),
            numberButton(number: 5, onKeyPress: onKeyPress
                //   size: buttonSize,
                //   color: buttonColor,
                ),
            numberButton(number: 6, onKeyPress: onKeyPress
                //  size: buttonSize,
                //     color: buttonColor,
                ),
          ],
        ),
        // const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            numberButton(number: 7, onKeyPress: onKeyPress
                //     size: buttonSize,
                //   color: buttonColor,
                ),
            numberButton(number: 8, onKeyPress: onKeyPress
                //      size: buttonSize,
                //   color: buttonColor,
                ),
            numberButton(number: 9, onKeyPress: onKeyPress
                //     size: buttonSize,
                //   color: buttonColor,
                ),
          ],
        ),
        // const SizedBox(height: 10),
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

  Widget numberButton({required int number, Function(String?)? onKeyPress}) {
    return SizedBox(
      child: TextButton(
          child: Text(
            number.toString(),
            style: const TextStyle(
                fontSize: 30,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w400),
          ),
          onPressed: () =>
              onKeyPress ?? controller!.handleChange(number.toString())),
    );
  }
}
