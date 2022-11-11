import 'package:food_delivery/pages/authentication/controllers/auth_controller.dart';
import 'package:food_delivery/routes/routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    String? isLoggedIn = await Get.find<AuthController>().getAccess();
    isLoading.value = false;
    isLoggedIn == null
        ? Get.offAllNamed(Routes.introduction)
        : Get.offAllNamed(Routes.main);
  }
}
