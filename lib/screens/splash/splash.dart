// On Boarding Screen(First Screen)

// Import packages
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// Import local files/classes
import '../../utils/widget_util.dart';
import '../../routes/app_routes.dart';
import '../../utils/assets.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/text_widgets.dart';

class Splash extends StatefulWidget {
   const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash>  with SingleTickerProviderStateMixin{
  bool loading = true, onSignUp = false, isInitialized = true, hasStarted = false;
  late AnimationController  _animationController;
  late Animation<Alignment>  _leftAlignAnimation, _rightAlignAnimation;

  // used the function to handle the event on sign-up pressed
  void onSignUpPressed() {
    setState(() => onSignUp = true);
  }

  // used this function for handle the next page route
  void handleNavigation(String type) {
    final _box = GetStorage();
    _box.write("loginType", type);
    Get.toNamed(AppRoutes.REGISTER);
  }

  Future initialize() async {
    Future.delayed(
      const Duration(milliseconds: 1000), () {
      setState(() {
        hasStarted = true;
        isInitialized = false;
      });
      _animationController.forward();
      Future.delayed(
        const Duration(milliseconds: 1800,), () {
        setState(() => loading = false);},
      );
    },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(vsync: this,duration: const Duration(milliseconds: 1500));
    _leftAlignAnimation = AlignmentTween(begin:  const Alignment(-1,1),end:   const Alignment(-.38,0)).animate(_animationController);
    _rightAlignAnimation = AlignmentTween(begin:  const Alignment(1,1),end: const Alignment(.38,0)).animate(_animationController);
    //animation should be for x = -1 to .25, y = 1-0
    initialize();
  }

  @override
  Widget build(BuildContext context) {
    Duration _animationDuration = const Duration(milliseconds: 1000);
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [

          Container(height: Get.height,),

          if(loading && hasStarted)
            gearLeftImg(_animationDuration),

          if(loading && hasStarted)
            gearRightImg(_animationDuration),

          if(!loading)
          SizedBox(
            width: Get.width,
            child: Center(
              child: SvgPicture.asset(
                Assets.linksLogo,
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: getBottomWidget(),
    );

  }

  Widget gearLeftImg(Duration duration) {
    //animation should be for x = -1 to .25, y = 1-0
    return AlignTransition(
        alignment:
        // const Alignment(-.25,0),
        _leftAlignAnimation,
        // alignment: const Alignment(-0.28,0),
        child: SvgPicture.asset(Assets.leftGear, fit: BoxFit.fill,height: Get.width * .35, width: Get.width * .35,));
  }

  Widget gearRightImg(Duration duration) {
    //animation should be for x = 1 to .25 y = 1-0
    return  AlignTransition(
      alignment: _rightAlignAnimation,
      child: Image.asset(Assets.rightGear,height: Get.width * .35,
          width: Get.width * .35
      ),
    );
  }

  Widget getBottomWidget() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            Constants.radius,
          ),
          topRight: Radius.circular(
            Constants.radius,
          ),
        ),
      ),
      width: Get.width,
      height: Get.height * Constants.bottomSize,
      padding: const EdgeInsets.only(top: 0),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 1000),
        child: onSignUp ?
        Column(
          key: const ValueKey("typeSelection"),
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TitleText(
              text: 'signUpAs'.tr,
              weight: FontWeight.bold,
              color: AppColors.primaryColor,
              size: Constants.subHeading,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
              label: 'houseHead'.tr,
              onTap: () => handleNavigation("houseHead"),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
              label: 'business'.tr,
              onTap: () => handleNavigation("business"),
            ),
          ],
        ) :
        Column(
          key: const ValueKey("welcome"),
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TitleText(
              text: 'welcome'.tr,
              weight: FontWeight.bold,
              color: AppColors.primaryColor,
              size: Constants.heading,
            ),
            WidgetUtils.spaceVrt40,
            CustomButton(
              label: 'signUpButton'.tr,
              onTap: onSignUpPressed,
            ),
          ],
        )
      ),
    );
  }
}
