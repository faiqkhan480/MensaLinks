import 'package:get/get.dart';
import 'package:mensa_links/bindings/home_binding.dart';
import 'package:mensa_links/bindings/member_binding.dart';
import 'package:mensa_links/screens/members/dependent_card.dart';
import 'package:mensa_links/screens/members/edit_member.dart';
// import 'package:mensa_links/screens/members/member_list.dart';
// import 'package:mensa_links/screens/auth/account_created.dart';
// import 'package:mensa_links/screens/auth/pin_screen.dart';

// IMPORT BINDINGS
import '../screens/account/create_account.dart';
import '../screens/account/manage_account.dart';
import '../screens/account/process_salary.dart';
import '../screens/account/register_payment.dart';
import '../screens/account/transfer_money.dart';
import '../screens/auth/account_created.dart';
import '../bindings/auth_binding.dart';
import '../screens/auth/pin_screen.dart';
import '../screens/members/member_list.dart';
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
        binding: HomeBinding(),
        page: () => HomeScreen()
    ),
    GetPage(
        name: AppRoutes.CREATEACCOUNT,
        page: () => CreateAccount()
    ),
    GetPage(
        name: AppRoutes.MANAGEACCOUNT,
        binding: MemberBinding(),
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
    GetPage(
        name: AppRoutes.MEMBERS,
        page: () => MemberList()
    ),
    GetPage(
        name: AppRoutes.MEMBEREDIT,
        page: () => EditMember()
    ),
    GetPage(
        name: AppRoutes.DEPENDENTCARD,
        page: () => DependentCard()
    ),
  ];
}