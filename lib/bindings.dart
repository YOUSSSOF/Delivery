import 'package:food_delivery/pages/authentication/controllers/auth_controller.dart';
import 'package:food_delivery/pages/card/controllers/card_controller.dart';
import 'package:food_delivery/pages/cart/controllers/cart_controller.dart';
import 'package:food_delivery/pages/home/controllers/delivery_controller.dart';
import 'package:food_delivery/pages/home/controllers/search_controller.dart';
import 'package:food_delivery/pages/main/controllers/bottom_navigator_controller.dart';
import 'package:food_delivery/pages/profile/controllers/profile_controller.dart';
import 'package:food_delivery/pages/splash/controllers/splash_controller.dart';
import 'package:food_delivery/pages/verify/controllers/code_controller.dart';
import 'package:get/get.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => AuthController(), fenix: true);
    Get.lazyPut(() => CodeController(), fenix: true);
    Get.lazyPut(() => BottomNavigatorController(), fenix: true);
    Get.lazyPut(() => SearchController(), fenix: true);
    Get.lazyPut(() => DeliveryController(), fenix: true);
    Get.lazyPut(() => CardController (), fenix: true);
    Get.put(CartController(), permanent: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
  }
}
