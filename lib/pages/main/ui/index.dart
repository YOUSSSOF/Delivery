import 'package:flutter/material.dart';
import 'package:food_delivery/pages/main/ui/widgets/bottom_navigation_bar_item_icon.dart';
import 'package:get/get.dart';
import 'package:food_delivery/core/theme/colors.dart';
import 'package:food_delivery/core/utils/dimesions.dart';
import 'package:food_delivery/pages/main/controllers/bottom_navigator_controller.dart';

class Main extends GetView<BottomNavigatorController> {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => IndexedStack(
            
            index: controller.index.value,
            children: controller.views,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(
        () => Container(
          margin: EdgeInsets.fromLTRB(
            Dimensions.size20,
            0,
            Dimensions.size20,
            Dimensions.size30,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(Dimensions.size28),
            child: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: AppColors.main,
              ),
              child: BottomNavigationBar(
                currentIndex: controller.index.value,
                onTap: controller.changeIndex,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                backgroundColor: AppColors.main,
                items: [
                  BottomNavigationBarItem(
                    icon: BottomNavigationBarItemIcon(
                      icon: 'assets/icons/home.svg',
                      index: 0,
                      current: controller.index.value,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: BottomNavigationBarItemIcon(
                      icon: 'assets/icons/wallet.svg',
                      index: 1,
                      current: controller.index.value,
                    ),
                    label: 'Your Wallet',
                  ),
                  BottomNavigationBarItem(
                    icon: BottomNavigationBarItemIcon(
                      icon: 'assets/icons/cart.svg',
                      index: 2,
                      current: controller.index.value,
                    ),
                    label: 'Your Cart',
                  ),
                  BottomNavigationBarItem(
                    icon: BottomNavigationBarItemIcon(
                      icon: 'assets/icons/profile.svg',
                      index: 3,
                      current: controller.index.value,
                    ),
                    label: 'Your Profile',
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
