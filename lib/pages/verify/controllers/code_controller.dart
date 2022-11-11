import 'dart:async';

import 'package:get/get.dart';

class CodeController extends GetxController {
  @override
  void onClose() {
    timer.cancel();
    super.onClose();
  }

  @override
  void onInit() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondsRemaining.value != 0) {
        secondsRemaining--;
      } else {
        enableResend.value = true;
      }
    });
    super.onInit();
  }

  RxInt secondsRemaining = 30.obs;
  RxBool enableResend = false.obs;
  late Timer timer;
}
