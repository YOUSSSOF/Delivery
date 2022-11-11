import 'package:food_delivery/pages/card/ui/index.dart';
import 'package:food_delivery/pages/cart/ui/index.dart';
import 'package:food_delivery/pages/home/ui/index.dart';
import 'package:food_delivery/pages/profile/ui/index.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class BottomNavigatorController extends GetxController {
  RxInt index = 0.obs;
  var views = [
    const HomePage(),
    CardPage(),
    const CartPage(),
    ProfilePage(),
  ];
  void changeIndex(int i) => index.value = i;
}
