import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mensa_links/utils/assets.dart';
import 'package:mensa_links/utils/colors.dart';
import 'package:mensa_links/utils/screen_properties.dart';
import 'package:mensa_links/utils/widget_util.dart';
import 'package:mensa_links/widgets/custom_animated_checkmark.dart';
import 'package:mensa_links/widgets/custom_small_divider.dart';

import '../utils/constants.dart';
import 'text_widgets.dart';

class SimpleDefaultScreenLayout extends StatelessWidget {
  const SimpleDefaultScreenLayout({
    Key? key,
    required this.child,
    this.showAppBar = true,
    this.actions,
    this.appbarTitle,
    this.leadingWidget,
    this.padding,
    this.onBackTapInside,
    this.handleBack,
    this.showBackButton = false,
    this.showAppBarBackButton = true,
    this.resizeToAvoidBottomInset = true,
    this.showBackButtonInside = false,
    this.bottomNavigation,
    this.pageTitle,
    this.pageSubtitle,
    this.pageTitleSize
  }) : super(key: key);

  final Widget child;
  final bool showAppBar,
      resizeToAvoidBottomInset,
      showBackButton,
      showBackButtonInside;
  final List<Widget>? actions;
  final Widget? appbarTitle, leadingWidget;
  final EdgeInsets? padding;
  final VoidCallback? onBackTapInside, handleBack;
  final Widget? bottomNavigation, pageSubtitle;
  final bool showAppBarBackButton;
  final String? pageTitle;
  final double? pageTitleSize;
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   statusBarColor: Colors.transparent,
    // ));
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
                            onPressed: handleBack ?? () => Get.back(),
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                padding: padding ?? UIStyleProperties.insetsHzt20,
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
                              padding: UIStyleProperties.smallInsets5,
                              child: CustomSmallDivider(),
                            ),
                          ),
                    // showBackButtonInside
                    //     ? WidgetUtils.noSpace
                    //     : WidgetUtils.spaceVrt10,
                    if(pageTitle != null)
                      _pageTitleWidget(),

                    if(pageSubtitle != null)
                        Padding(
                          padding: UIStyleProperties.insetsHzt20,
                          child: pageSubtitle!,
                        ),
                      // Center(child: ScreenTitle(text: pageTitle!, size: pageTitleSize,)),
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

  Widget _pageTitleWidget () {
    return MediaQuery(
      data: Get.mediaQuery.copyWith(textScaleFactor: 1),
      child: LayoutBuilder(
          builder: (context, size) {
            return Text(
              pageTitle!.tr,
              maxLines: 1,
              textAlign: TextAlign.center,
              // softWrap: false,
              // overflow: TextOverflow.visible,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
                // fontSize: size ?? Constants.heading,
                // fontSize: Get.textScaleFactor * 20.0,
                fontSize: size.maxWidth * (pageTitleSize ?? 0.055),
              ),
            );
          }
      ),
    );
  }

  IconButton _buildBackButton() {
    return IconButton(
      onPressed: onBackTapInside ?? () => Get.back(),
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
