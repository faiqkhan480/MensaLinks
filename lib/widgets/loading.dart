import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:mensa_links/utils/assets.dart';
import 'package:mensa_links/utils/colors.dart';
import 'package:mensa_links/utils/screen_properties.dart';
import 'package:mensa_links/widgets/custom_animated_checkmark.dart';
import 'package:simple_animations/simple_animations.dart';

class Loading extends StatefulWidget {
  final Function() onComplete;

  const Loading({
    Key? key,
    required this.onComplete,
  }) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  bool completed = false;

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
                  Image.asset(
                    Assets.whiteLogo,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const CustomAnimatedCheckMark(
                    backgroundColor: AppColors.backgroundColor,
                    checkMarkColor: AppColors.primaryColor,
                  ),
                ],
              ),
      ),
    );
  }
}
