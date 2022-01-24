import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController with GetSingleTickerProviderStateMixin{
  late TabController tabController;

  final RxInt currentTabIndex = 0.obs;
  @override
  void onInit() {
    tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: currentTabIndex.value,
    );

    super.onInit();
  }

  void changeTab(int index) {
    currentTabIndex(index);
  }

  // void _checkUserAndNavigate() async {
  //   await Future.delayed(300.milliseconds, () {
  //     String? afterLoginRoute;

  //     if (Get.parameters.containsKey('then')) {
  //       afterLoginRoute = Get.parameters['then']!;
  //     }

  //     if (afterLoginRoute != null) {
  //       Get.offNamed(afterLoginRoute);
  //     } else {
  //       Get.offNamed(Routes.DASHBOARD);
  //     }
  //   });
  // }

  @override
  void onClose() {
    // loginForm.reset();
    // registerForm.reset();
    // isLoginPassVisible(false);
    // isRegisterPassVisible(false);
    // isRegisterConfirmPassVisible(false);
    super.onClose();
  }

  // void login() async {
  //   Get.log('loginin');
  //   if (loginForm.valid) {
  //     loginForm.unfocus();
  //     isAuthProcessing(true);
  //     await _userService.globalLogin(loginby: "login", credential: {
  //       'email': loginForm.value['email'],
  //       // 'password': loginForm.value['password'],
  //       'password': "P@ssw0rd!",
  //     }).then(
  //       (_loginResponse) {
  //         print(_loginResponse);
  //         isAuthProcessing(_loginResponse);
  //         if (_loginResponse) {
  //           _checkUserAndNavigate();
  //         }
  //       },
  //     );
  //   } else {
  //     loginForm.markAllAsTouched();
  //   }
  // }

  // void registerWithEmail() async {
  //   if (registerForm.valid) {
  //     registerForm.unfocus();
  //     isAuthProcessing(true);
  //     await _userService.globalLogin(
  //       loginby: "register",
  //       credential: {
  //         'name': registerForm.value['name'],
  //         'phone': registerForm.value['phone'] == null ||
  //                 registerForm.value['phone'] == ""
  //             ? null
  //             : "+${CountryPickerUtils.getCountryByIsoCode(_locationService.currentCountryCode.value).phoneCode}-${registerForm.value['phone']}",
  //         'email': registerForm.value['email'],
  //         // 'password': registerForm.value['password'],
  //         'password': "P@ssw0rd!",
  //       },
  //     ).then(
  //       (_registerResponse) {
  //         isAuthProcessing(_registerResponse);

  //         if (_registerResponse) {
  //           _checkUserAndNavigate();
  //         }
  //       },
  //     );
  //   } else {
  //     BotToast.showText(
  //       text: 'Registration Unsuccessful'.tr,
  //       duration: 2.seconds,
  //     );
  //     registerForm.markAllAsTouched();
  //   }
  // }

  // void forgetPassword() {
  //   print('Forget password');
  // }
}
