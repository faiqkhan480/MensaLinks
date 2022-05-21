//
// class ReEnterPinScreen extends StatelessWidget {
//   ReEnterPinScreen({Key? key}) : super(key: key);
//
//   final RePinController _controller = Get.put(RePinController());
//   final args = Get.arguments;
//
//   @override
//   Widget build(BuildContext context) {
//     return SimpleDefaultScreenLayout(
//       child: loginOtp(),
//     );
//   }
//
//   Widget loginOtp() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         Padding(
//           padding: UIStyleProperties.insetsVrt20Hzt20,
//           child: TitleText(
//             text: 're_enter_your_new_pin',
//             size: Constants.heading20,
//             weight: FontWeight.w700,
//             color: AppColors.primaryColor,
//           ),
//         ),
//         Container(
//           // padding: UIStyleProperties.topInset10,
//           alignment: Alignment.center,
//           child: CustomPinCodeField(
//             controller: _controller.pinField,
//             backgroundColor: AppColors.skyLightColor,
//             isObscured: true,
//             fieldHeight: 80,
//             fieldWidth: 55,
//             keyboardType: TextInputType.none,
//             onComplete: (val) => _controller.handleComplete(args),
//           ),
//         ),
//         Flexible(
//           child: CustomPinKeyboard(
//             controller: _controller,
//             onKeyPress: _controller.handleChangeForRePin,
//             delete: _controller.handleDeleteForRePin,
//           ),
//         ),
//       ],
//     );
//   }
// }
