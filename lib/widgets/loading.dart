import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:mensa_links/utils/assets.dart';
import 'package:mensa_links/utils/colors.dart';
import 'package:mensa_links/utils/screen_properties.dart';
import 'package:mensa_links/widgets/custom_animated_checkmark.dart';
import 'package:mensa_links/widgets/custom_button.dart';
import 'package:mensa_links/widgets/text_widgets.dart';
import 'package:simple_animations/simple_animations.dart';

import '../utils/constants.dart';

class Loading extends StatefulWidget {
  final Function() onComplete;
  final VoidCallback? onDone;
  final bool waveLoading;
  const Loading({
    Key? key,
    this.waveLoading = true,
    required this.onComplete,
    this.onDone,
  }) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  bool completed = false;
  bool showButton = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    completed = !widget.waveLoading;
    if(!widget.waveLoading) {
      Future.delayed(
        const Duration(milliseconds: 2000),
          () => setState(() => showButton = true),
      );
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: !completed
            ? Container(
                width: size.width * .6,
                height: size.width * .6,
                padding: UIStyleProperties.defaultInsets,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: UIStyleProperties.thickBorder,
                ),
                child: PlayAnimation<double>(
                  duration: const Duration(seconds: 4),
                  tween: Tween(begin: 0, end: 1),
                  curve: Curves.easeInBack,
                  onComplete: () {
                    setState(() {
                      completed = true;
                    });
                    widget.onComplete();
                  },
                  builder: (ctx, widget, value) {
                    return SizedBox(
                      child: LiquidCircularProgressIndicator(
                        value: value,
                        valueColor: const AlwaysStoppedAnimation(AppColors.slightlyGrey),
                        center: widget,
                        backgroundColor: AppColors.primaryColor,
                        direction: Axis.vertical,
                      ),
                    );
                  },
                  child: Image.asset(
                    Assets.whiteLogo,
                    height: size.width * .25,
                  ),
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(Assets.linksLogo,),
                  // Image.asset(Assets.whiteLogo,),
                  const SizedBox(height: 30,),
                  if(widget.waveLoading)
                    const CustomAnimatedCheckMark(
                      backgroundColor: AppColors.backgroundColor,
                      checkMarkColor: AppColors.primaryColor,
                    )
                  else
                  Container(
                    decoration: UIStyleProperties.roundedRadiusDecoration(radius: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                    margin: const EdgeInsets.symmetric(horizontal: 50),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: TitleText(
                            text: 'Pin Set Successfully!\nProceed To Sign In',
                            size: Constants.heading20,
                            weight: FontWeight.w700,
                            color: AppColors.primaryColor,
                            align: TextAlign.center,
                          ),
                        ),
                        if(showButton)
                          CustomButton(
                            label: "OK",
                            onTap: () => widget.onDone!(),
                          )
                        else
                          const CustomAnimatedCheckMark(
                          backgroundColor: AppColors.primaryColor,
                          checkMarkColor: AppColors.backgroundColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
