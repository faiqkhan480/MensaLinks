import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mensa_links/utils/assets.dart';
import 'package:mensa_links/utils/colors.dart';
import 'package:mensa_links/utils/screen_properties.dart';
import 'package:mensa_links/utils/widget_util.dart';
import 'package:mensa_links/widgets/custom_animated_checkmark.dart';
import 'package:mensa_links/widgets/custom_small_divider.dart';

import 'title_text.dart';

class SimpleDefaultScreenLayout extends StatelessWidget {
  const SimpleDefaultScreenLayout({
    Key? key,
    required this.child,
    this.showAppBar = true,
    this.actions,
    this.appbarTitle,
    this.leadingWidget,
    this.padding,
    this.onBackTap,
    this.showBackButton = false,
    this.showAppBarBackButton = true,
    this.resizeToAvoidBottomInset = true,
    this.showBackButtonInside = false,
    this.bottomNavigation,
    this.pageTitle
  }) : super(key: key);

  final Widget child;
  final bool showAppBar,
      resizeToAvoidBottomInset,
      showBackButton,
      showBackButtonInside;
  final List<Widget>? actions;
  final Widget? appbarTitle, leadingWidget;
  final EdgeInsets? padding;
  final VoidCallback? onBackTap;
  final Widget? bottomNavigation;
  final bool showAppBarBackButton;
  final String? pageTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      bottomNavigationBar: bottomNavigation,
      appBar: !showAppBar
          ? null
          : PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: AppBar(
                leading: leadingWidget ??
                    (showAppBarBackButton
                        ? IconButton(
                            onPressed: () => Get.back(),
                            icon: const Icon(Icons.arrow_back_ios))
                        : null),
                toolbarHeight: kToolbarHeight,
                centerTitle: true,
                backgroundColor: AppColors.primaryColor,
                elevation: 0.0,
                title: SvgPicture.asset(
                  Assets.logo,
                  height: kToolbarHeight * 0.80,
                ),
              ),
            ),
      body: SafeArea(
        child: Column(
          children: [
            showAppBar ? WidgetUtils.noSpace : WidgetUtils.spaceVrt10,
            showBackButton
                ? !showBackButtonInside
                    ? Align(
                        alignment: Alignment.centerLeft,
                        child: _buildBackButton(),
                      )
                    : WidgetUtils.noSpace
                : WidgetUtils.noSpace,
            showBackButtonInside ? WidgetUtils.spaceVrt20 : WidgetUtils.noSpace,
            Expanded(
              child: Container(
                margin: showAppBar
                    ? UIStyleProperties.topInset10
                    : UIStyleProperties.zero,
                width: Get.width,
                padding: padding ?? UIStyleProperties.insetsVrt8Hzt20,
                decoration: UIStyleProperties.styleRadiusDecoration(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    showBackButtonInside
                        ? _buildBackButton()
                        : WidgetUtils.noSpace,
                    showBackButtonInside
                        ? WidgetUtils.noSpace
                        : const Center(
                            child: Padding(
                              padding: UIStyleProperties.defaultInsets,
                              child: CustomSmallDivider(),
                            ),
                          ),
                    showBackButtonInside
                        ? WidgetUtils.noSpace
                        : WidgetUtils.spaceVrt15,
                    if(pageTitle != null)
                      Center(child: ScreenTitle(text: pageTitle!,)),
                    Expanded(child: child),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconButton _buildBackButton() {
    return IconButton(
      onPressed: onBackTap ?? () => Get.back(),
      icon: Icon(
        Icons.arrow_back_ios,
        color: showBackButtonInside ? AppColors.ultraDarkGrey : AppColors.white,
      ),
    );
  }
}

class BottomLayoutWidget extends StatelessWidget {
  final Widget? topWidgets;
  final Widget bottomWidgets;
  final String? logoPath;
  final bool isCheckMarkVisible;

  const BottomLayoutWidget({
    Key? key,
    this.logoPath,
    this.topWidgets,
    required this.bottomWidgets,
    this.isCheckMarkVisible = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          flex: 4,
          child: topWidgets ??
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset(
                      Assets.logo,
                  ),
                  // Image.asset(
                  //   logoPath ?? Assets.logo,
                  //   height: size.width * .4,
                  // ),
                  WidgetUtils.spaceVrt25,
                  isCheckMarkVisible
                      ? const CustomAnimatedCheckMark()
                      : WidgetUtils.noSpace,
                ],
              ),
        ),
        WidgetUtils.spaceVrt15,
        Expanded(flex: 2, child: bottomWidgets),
      ],
    ));
  }
}
