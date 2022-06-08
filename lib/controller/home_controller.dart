import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mensa_links/routes/app_routes.dart';

import '../widgets/done_screen.dart';

class HomeController extends GetxController {
  final GetStorage _box = GetStorage();
  final ImagePicker _picker = ImagePicker();
  File? _image;

  RxString emiratesId = "Emirates ID".obs;
  RxBool businessLogin = false.obs;
  RxBool familyFormSubmitted = false.obs;
  RxBool salaryProcessed = false.obs;
  RxBool isSave = false.obs;
  RxInt selectedTab = 0.obs;
  RxInt radioSelection = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    setLoginType();
  }

  void setLoginType() {
    if(_box.read("loginType") != null) {
      businessLogin.value = _box.read("loginType") == "business";
    }
  }

  void handleFamilyForm(bool val) {
    familyFormSubmitted.value = val;
  }

  void toVerifyDoc(String type) {
    var args = {
      "type": type
    };
    Get.toNamed(AppRoutes.DOCUMENTVERIFICATION, arguments: args);
  }

  void setValues() {
    salaryProcessed.value = false;
    isSave.value = false;
  }

  void handleTab(int val) => selectedTab.value = val;

  void handleProcessSalary(bool val) => salaryProcessed.value = val;

  void handleConfirm() {
    // isSave.value = true;
    Get.toNamed(AppRoutes.PIN, arguments: "salary");
  }

  void handleConfirmStaffSalary() {
    isSave.value = true;
    Get.toNamed(AppRoutes.PROCESSSALRY, arguments: "from_staff");
  }

  void handleRegisterPayment() {
    Get.off(const DoneScreen(message: "Thank you! Verification in progress.", counts: 1,));
  }

  void setRadioValue(int val) => radioSelection.value = val;

  void handleSaveAndProceedSalary() {

  }

  void handleLogout() {
    Get.offNamedUntil(AppRoutes.ACCOUNTCREATED, (route) => false, arguments: {'welcome': 'welcome_msg'});
  }

  Future uploadImage() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);

    if(image != null){
      // setState(() {
        _image = image as File;
      // });
    }
  }

  void handleEmiratesID(String? val) {
    emiratesId.value = val!;
  }
}