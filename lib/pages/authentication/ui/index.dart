import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/functions.dart';
import 'package:food_delivery/pages/authentication/controllers/auth_controller.dart';
import 'package:food_delivery/pages/authentication/ui/widgets/social_button.dart';
import 'package:food_delivery/pages/authentication/ui/widgets/submit_button.dart';
import 'package:get/get.dart';
import 'package:food_delivery/core/theme/colors.dart';
import 'package:food_delivery/core/utils/dimesions.dart';
import 'package:food_delivery/pages/introduction/ui/widgets/my_text.dart';

final List<Map<String, int>> codes = [
  {'Iran': 98},
  {'Afghanistan': 004},
  {'Albania': 008},
  {'Bahrain	': 048},
  {'Bangladesh': 880},
];

class AuthPage extends GetView<AuthController> {
  AuthPage({super.key});

  Map<String, int> current = codes[0];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(Dimensions.size30),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () => Get.back(),
                    icon: const Icon(
                      Icons.close,
                      size: 40,
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.size50,
                  ),
                  Obx(
                    () => MyText(
                      text: controller.isLogin.value
                          ? 'Login to Food Delivery App'
                          : 'Welcome to Food Delivery App',
                      size: Dimensions.size22,
                      weight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.size30,
                  ),
                  Column(
                    children: [
                      Container(
                        width: Dimensions.screenWidth,
                        padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.size30,
                          vertical: Dimensions.size15,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFFE6E6E6),
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Dimensions.size25),
                            topRight: Radius.circular(Dimensions.size25),
                          ),
                        ),
                        child: GetBuilder<AuthController>(
                          builder: (_) {
                            return DropdownButtonHideUnderline(
                              child: DropdownButton<Map<String, int>>(
                                value: current,
                                icon: const Icon(Icons.keyboard_arrow_down),
                                items: codes.map((Map<String, int> item) {
                                  return DropdownMenuItem(
                                    value: item,
                                    child: MyText(
                                      text:
                                          '${item.keys.toString().split('(')[1].split(')')[0]} +${item.values}',
                                      size: 20,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  current = newValue!;
                                  controller.update();
                                },
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.size30,
                          vertical: Dimensions.size15,
                        ),
                        height: Dimensions.size50,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFFE6E6E6),
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(Dimensions.size25),
                            bottomRight: Radius.circular(Dimensions.size25),
                          ),
                        ),
                        child: TextField(
                          controller: controller.textEditingController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.only(top: Dimensions.size30),
                            hintText: 'Phone Number',
                            hintStyle: TextStyle(
                              fontSize: Dimensions.size18,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textBody2,
                            ),
                          ),
                          cursorColor: AppColors.main,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.size15,
                  ),
                  MyText(
                    text:
                        'We will call or text you to confirm your number. You will get a code. Please do not share the code with anyone!',
                    size: Dimensions.size14,
                    color: AppColors.textBody1,
                    align: TextAlign.justify,
                    wordSpacing: 3,
                    lineHeight: 1.4,
                  ),
                  SizedBox(
                    height: Dimensions.size20,
                  ),
                  Obx(() => SubmitButton(
                        text: controller.isLogin.value
                            ? 'Sign Up with phone number'
                            : 'Sign In with phone number',
                        isLoading: controller.isLoading.value,
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          try {
                            verifyAuthFiled(
                              controller.textEditingController.text,
                            );
                          } catch (e) {
                            mySnackbar(true, e.toString().split(':')[1]);
                            return;
                          }
                          controller.isLogin.value
                              ? controller.sendRegisterSms(
                                  current.values.first,
                                  controller.textEditingController.text,
                                )
                              : controller.sendLoginSms(
                                  current.values.first,
                                  controller.textEditingController.text,
                                );
                        },
                      )),
                  SizedBox(
                    height: Dimensions.size35,
                  ),
                  Row(
                    children: [
                      const Expanded(child: Divider()),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: Dimensions.size20),
                        child: const MyText(text: 'or'),
                      ),
                      const Expanded(child: Divider()),
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.size35,
                  ),
                  SocialButton(
                    icon: 'assets/icons/facebook.svg',
                    name: 'Facebook',
                    onTap: controller.loginWithGoogle,
                  ),
                  SizedBox(
                    height: Dimensions.size15,
                  ),
                  SocialButton(
                    icon: 'assets/icons/google.svg',
                    name: 'Google',
                    onTap: controller.loginWithGoogle,
                  ),
                  SizedBox(
                    height: Dimensions.size50,
                  ),
                  Obx(
                    () => Row(
                      children: [
                        MyText(
                          text: controller.isLogin.value
                              ? 'Already have an account?'
                              : 'Are you new to this app?',
                          color: AppColors.textBody3,
                          size: Dimensions.size18,
                        ),
                        TextButton(
                          onPressed: () => controller.toggleForm(),
                          child: MyText(
                            text:
                                controller.isLogin.value ? 'Sign up' : 'Login',
                            color: AppColors.main,
                            size: Dimensions.size18,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
