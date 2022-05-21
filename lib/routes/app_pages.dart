import 'package:get/get.dart';

// IMPORT BINDINGS
import '../bindings/home_binding.dart';
import '../bindings/member_binding.dart';
import '../bindings/auth_binding.dart';


// APP VIEWS
import '../screens/auth/register_scanner_screen.dart';
import '../screens/splash/splash.dart';
import '../screens/auth/register.dart';
import '../screens/auth/register_details.dart';
import '../screens/auth/contact_detail.dart';
import '../screens/auth/document_verification.dart';
import '../screens/home/home_screen.dart';
import '../screens/auth/pin_screen.dart';
import '../screens/members/dependent_card.dart';
import '../screens/members/edit_member.dart';
import '../screens/members/member_details.dart';
import '../screens/members/member_list.dart';
import '../screens/splash/splash_binding.dart';
import '../screens/account/create_account.dart';
import '../screens/account/manage_account.dart';
import '../screens/account/process_salary.dart';
import '../screens/account/process_staff_salary.dart';
import '../screens/account/register_payment.dart';
import '../screens/account/transfer_money.dart';
import '../screens/auth/account_created.dart';

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
        page: () => Register()),
    GetPage(
        name: AppRoutes.REGISTERSCANNER,
        binding: AuthBinding(),
        page: () => RegisterScanner()),
    GetPage(
      name: AppRoutes.REGISTERDETAIL,
      page: () => const RegisterDetails(),
    ),
    GetPage(
      name: AppRoutes.CONTACTDETAIL,
      page: () => const ContactDetails(),
    ),
    GetPage(
        name: AppRoutes.DOCUMENTVERIFICATION,
        page: () => const DocumentVerification()),
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
        page: () => const HomeScreen()
    ),
    GetPage(
        name: AppRoutes.CREATEACCOUNT,
        page: () => const CreateAccount()
    ),
    GetPage(
        name: AppRoutes.MANAGEACCOUNT,
        binding: MemberBinding(),
        page: () => const ManageAccount()
    ),
    GetPage(
        name: AppRoutes.REGISTERPAYMENT,
        page: () => const RegisterPayment()
    ),
    GetPage(
        name: AppRoutes.TRANSFERMONEY,
        page: () => const TransferMoney()
    ),
    GetPage(
        name: AppRoutes.PROCESSSALRY,
        page: () => const ProcessSalary()
    ),
    GetPage(
        name: AppRoutes.MEMBERS,
        page: () => const MemberList()
    ),
    GetPage(
        name: AppRoutes.MEMBEREDIT,
        page: () => const EditMember()
    ),
    GetPage(
        name: AppRoutes.DEPENDENTCARD,
        page: () => const DependentCard()
    ),
    GetPage(
        name: AppRoutes.MEMBERSDETAILS,
        page: () => const MemberDetails()
    ),
    GetPage(
        name: AppRoutes.PROCESSSTAFFSALARY,
        page: () => const ProcessStaffSalary()
    ),
  ];
}