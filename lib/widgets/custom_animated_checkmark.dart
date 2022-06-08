import 'package:animated_check/animated_check.dart';
import 'package:flutter/material.dart';
import 'package:mensa_links/utils/colors.dart';
import 'package:mensa_links/utils/screen_properties.dart';

class CustomAnimatedCheckMark extends StatefulWidget {
  final Color? backgroundColor, checkMarkColor;
  final double? size, strokeWidth;
  final Duration? delay, duration;

  @override
  _CustomAnimatedCheckMarkState createState() =>
      _CustomAnimatedCheckMarkState();

  const CustomAnimatedCheckMark({
    Key? key,
    this.backgroundColor,
    this.checkMarkColor,
    this.size,
    this.delay,
    this.duration,
    this.strokeWidth,
  }) : super(key: key);
}

class _CustomAnimatedCheckMarkState extends State<CustomAnimatedCheckMark> with SingleTickerProviderStateMixin {
  late AnimationController checkMarkAnimationController;
  late Animation<double> animatedCheckProgress;
  @override
  void initState() {
    super.initState();
    checkMarkAnimationController = AnimationController(
      vsync: this,
      duration: widget.duration ??
          const Duration(
            milliseconds: 1500,
          ),
    );
    animatedCheckProgress = Tween(begin: 0.0, end: 1.0).animate(checkMarkAnimationController);
    Future.delayed(
      widget.delay ?? const Duration(milliseconds: 500),
      checkMarkAnimationController.forward,
    );
  }

  @override
  void dispose() {
    checkMarkAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .18,
      height: size.width * .18,
      padding: UIStyleProperties.defaultInsets,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: widget.backgroundColor ?? AppColors.white,
      ),
      child: AnimatedCheck(
        progress: animatedCheckProgress,
        size: widget.size ?? 100,
        color: widget.checkMarkColor ?? AppColors.primaryColor,
        strokeWidth: widget.strokeWidth ?? 5,
      ),
    );
  }
}
