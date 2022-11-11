import 'package:flutter/material.dart';
import 'package:food_delivery/core/theme/colors.dart';
import 'package:food_delivery/core/utils/dimesions.dart';
import 'package:get/get.dart';

void mySnackbar(bool title, String content) {
  Get.snackbar(
    title ? 'Something wrong...' : 'Success!',
    content,
    backgroundColor: AppColors.main,
    colorText: Colors.white,
    margin: EdgeInsets.symmetric(
      horizontal: Dimensions.size20,
      vertical: Dimensions.size20,
    ),
  );
}

void verifyAuthFiled(String text) {
  if (text.isEmpty) {
    throw Exception('Please fill the input.');
  } else if (text.length < 10 || text.length > 11 || !text.isNum) {
    throw Exception('That\'s not a valid number.');
  }
}
