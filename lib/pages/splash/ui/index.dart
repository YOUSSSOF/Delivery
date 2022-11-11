import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/core/theme/colors.dart';
import 'package:food_delivery/core/utils/dimesions.dart';
import 'package:food_delivery/pages/splash/controllers/splash_controller.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SpalshPage extends GetView<SplashController> {
  const SpalshPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: AppColors.main,
        body: Center(
          child: controller.isLoading.value
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: Dimensions.size30),
                      child: Lottie.asset(
                        'assets/lottie/delivery.json',
                        width: Get.width / 1.1,
                      ),
                    ),
                  ],
                )
              : Container(),
        ),
      ),
    );
  }
}
