import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/core/theme/colors.dart';
import 'package:food_delivery/core/utils/dimesions.dart';
import 'package:food_delivery/pages/authentication/controllers/auth_controller.dart';
import 'package:food_delivery/pages/introduction/ui/widgets/my_text.dart';
import 'package:food_delivery/pages/splash/ui/widgets/loader.dart';
import 'package:food_delivery/pages/verify/controllers/code_controller.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyPage extends GetView<AuthController> {
  const VerifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/sent.svg',
                  height: Dimensions.size160,
                  width: Dimensions.size160,
                ),
                SizedBox(
                  height: Dimensions.size80,
                ),
                MyText(
                  text: 'Verify Account',
                  size: Dimensions.size20,
                  weight: FontWeight.w900,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.size40,
                  ),
                  child: MyText(
                    text:
                        'Please enter the verification code we sent To your Phone number.',
                    size: Dimensions.size18,
                    weight: FontWeight.w300,
                    lineHeight: 1.7,
                  ),
                ),
                SizedBox(
                  height: Dimensions.size80,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.size70,
                  ),
                  child: Obx(
                    () => PinCodeTextField(
                      appContext: context,
                      length: 4,
                      onCompleted: (val) => controller.auth(val),
                      onChanged: (value) {},
                      keyboardType: TextInputType.number,
                      enabled: controller.isLoading.value ? false : true,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        activeColor: controller.currentStatus.value ==
                                VerificationStatus.notSet
                            ? AppColors.main
                            : controller.currentStatus.value ==
                                    VerificationStatus.success
                                ? Colors.green
                                : Colors.red,
                        selectedColor: AppColors.main,
                        inactiveColor: const Color(0xFFE7E7E7),
                        borderRadius: BorderRadius.circular(Dimensions.size5),
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => controller.isLoading.value
                      ? Container(
                          margin: EdgeInsets.only(top: Dimensions.size30),
                          child: Loader(
                            color: AppColors.main,
                            size: Dimensions.size50,
                          ),
                        )
                      : Container(),
                ),
                Obx(
                  () => SizedBox(
                    height: controller.isLoading.value
                        ? Dimensions.size50
                        : Dimensions.size80,
                  ),
                ),
                MyText(
                  text: 'Didn’t get the code?',
                  size: Dimensions.size18,
                  weight: FontWeight.w300,
                ),
                SizedBox(
                  height: Dimensions.size10,
                ),
                Obx(
                  () => Get.find<CodeController>().enableResend.value
                      ? TextButton(
                          onPressed: controller.resendCode,
                          child: MyText(
                            text: 'Resend',
                            color: AppColors.main,
                            size: Dimensions.size18,
                          ),
                        )
                      : MyText(
                          text: Get.find<CodeController>()
                              .secondsRemaining
                              .toString(),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
