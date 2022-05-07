import 'package:get/get.dart';

// IMPORT BINDINGS
import '../screens/auth/binding.dart';
import '../screens/splash/splash_binding.dart';

// APP VIEWS
import '../screens/splash/splash.dart';
import '../screens/auth/register.dart';
import '../screens/auth/register_details.dart';
import '../screens/auth/contact_detail.dart';
import '../screens/auth/document_verification.dart';

// IMPORT ROUTES NAME
import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
        name: AppRoutes.SPLASH,
        binding: SplashBinding(),
        page: () => Splash()
    ),
    GetPage(
        name: AppRoutes.REGISTER,
        binding: AuthBinding(),
        page: () => Register()
    ),
    GetPage(
        name: AppRoutes.REGISTERDETAIL,
        page: () => const RegisterDetails()
    ),
    GetPage(
        name: AppRoutes.CONTACTDETAIL,
        page: () => const ContactDetails()
    ),
    GetPage(
        name: AppRoutes.DOCUMENTVERIFICATION,
        page: () => const DocumentVerification()
    ),
  ];
}