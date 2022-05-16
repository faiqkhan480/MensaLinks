import 'package:get/get.dart';
import 'package:mensa_links/screens/acount/create_account.dart';
import 'package:mensa_links/screens/acount/manage_account.dart';
import 'package:mensa_links/screens/acount/process_salary.dart';
import 'package:mensa_links/screens/acount/register_payment.dart';
import 'package:mensa_links/screens/acount/transfer_money.dart';
import 'package:mensa_links/screens/auth/account_created.dart';
import 'package:mensa_links/screens/auth/pin_screen.dart';

// IMPORT BINDINGS
import '../screens/auth/binding.dart';
import '../screens/splash/splash_binding.dart';

// APP VIEWS
import '../screens/splash/splash.dart';
import '../screens/auth/register.dart';
import '../screens/auth/register_details.dart';
import '../screens/auth/contact_detail.dart';
import '../screens/auth/document_verification.dart';
import '../screens/home/home_screen.dart';

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
    GetPage(
        name: AppRoutes.ACCOUNTCREATED,
        page: () => const AccountCreated()
    ),
    GetPage(
        name: AppRoutes.PIN,
        page: () => PinScreen()
    ),
    GetPage(
        name: AppRoutes.HOME,
        page: () => HomeScreen()
    ),
    GetPage(
        name: AppRoutes.CREATEACCOUNT,
        page: () => CreateAccount()
    ),
    GetPage(
        name: AppRoutes.MANAGEACCOUNT,
        page: () => ManageAccount()
    ),
    GetPage(
        name: AppRoutes.REGISTERPAYMENT,
        page: () => RegisterPayment()
    ),
    GetPage(
        name: AppRoutes.TRANSFERMONEY,
        page: () => TransferMoney()
    ),
    GetPage(
        name: AppRoutes.PROCESSSALRY,
        page: () => ProcessSalary()
    ),
  ];
}