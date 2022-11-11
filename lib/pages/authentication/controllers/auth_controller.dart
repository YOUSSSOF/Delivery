import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:food_delivery/core/utils/functions.dart';
import 'package:food_delivery/network/models/user.dart';
import 'package:food_delivery/pages/verify/controllers/code_controller.dart';
import 'package:food_delivery/routes/routes.dart';
import 'package:get/get.dart';

enum VerificationStatus { notSet, success, failed }

class AuthController extends GetxController {
  @override
  void onClose() {
    textEditingController.dispose();
    super.onClose();
  }

  Rx<VerificationStatus> currentStatus = VerificationStatus.notSet.obs;
  RxBool isLoading = false.obs;
  RxBool isLogin = false.obs;

  TextEditingController textEditingController = TextEditingController();

  final storage = const FlutterSecureStorage();

  Future<void> saveToken(String access, String refresh) async {
    await storage.write(key: 'access', value: access);
    await storage.write(key: 'refresh', value: refresh);
  }

  Future<String?> getAccess() async => await storage.read(key: 'access');
  Future<String?> getRefresh() async => await storage.read(key: 'refresh');

  void toggleForm() => isLogin.value = !isLogin.value;

  void sendLoginSms(int code, phone) async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    Get.toNamed(Routes.verify);
    isLoading.value = false;
  }

  void sendRegisterSms(int code, phone) async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    Get.toNamed(Routes.verify);
    isLoading.value = false;
  }

  void resendCode() {
    Get.find<CodeController>().secondsRemaining.value = 30;
    Get.find<CodeController>().enableResend.value = false;
    mySnackbar(false, 'Code resnded.');
  }

  void auth(String code) async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 3));
    if (code == '1234') {
      currentStatus.value = VerificationStatus.success;
      Get.offAllNamed(Routes.main);
      mySnackbar(false, 'Welcome!');
    } else {
      currentStatus.value = VerificationStatus.failed;
    }
    isLoading.value = false;
  }

  void loginWithGoogle() {}
  void loginWithFaceBook() {}
}
