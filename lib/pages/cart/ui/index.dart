import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/core/theme/colors.dart';
import 'package:food_delivery/core/utils/dimesions.dart';
import 'package:food_delivery/network/models/cart.dart';
import 'package:food_delivery/network/models/food.dart';
import 'package:food_delivery/pages/cart/controllers/cart_controller.dart';
import 'package:food_delivery/pages/cart/ui/widgets/cart_card.dart';
import 'package:food_delivery/pages/food%20detail/ui/index.dart';
import 'package:food_delivery/pages/food%20detail/ui/widgets/quantity_button.dart';
import 'package:food_delivery/pages/introduction/ui/widgets/my_text.dart';
import 'package:food_delivery/pages/main/controllers/bottom_navigator_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CartPage extends GetView<CartController> {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: Dimensions.size30,
          horizontal: Dimensions.size20,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(
                  text: 'My Cart',
                  size: Dimensions.size24,
                  weight: FontWeight.w900,
                ),
                SvgPicture.asset(
                  'assets/icons/cart.svg',
                  height: Dimensions.size25,
                  width: Dimensions.size25,
                ),
              ],
            ),
            SizedBox(
              height: Dimensions.size60,
            ),
            GetBuilder<CartController>(
              builder: (context) {
                return Column(
                  children: [
                    controller.cart.items.isEmpty
                        ? Container(
                            height: Get.height / 1.4,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const MyText(text: 'Your Cart is Empty'),
                                  SizedBox(
                                    height: Dimensions.size20,
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      elevation: MaterialStateProperty.all(0),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              AppColors.main),
                                    ),
                                    onPressed: () =>
                                        Get.find<BottomNavigatorController>()
                                            .changeIndex(0),
                                    child: const MyText(
                                      text: 'Back to Home',
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.cart.items.length,
                            itemBuilder: (_, index) {
                              CartItem current = controller.cart.items[index];
                              return CartCard(
                                controller: controller,
                                item: current,
                              );
                            },
                            separatorBuilder: (_, __) => SizedBox(
                              height: Dimensions.size40,
                            ),
                          ),
                    SizedBox(
                      height: Dimensions.size80,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: Dimensions.size10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText(
                                text:
                                    '${controller.cart.items.length} item selected',
                                color: AppColors.lightGrey,
                                weight: FontWeight.w300,
                              ),
                              SizedBox(
                                height: Dimensions.size10,
                              ),
                              MyText(
                                text: '\$${controller.cart.totalPrice}',
                                weight: FontWeight.w900,
                                size: Dimensions.size18,
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.all(Dimensions.size20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(Dimensions.size45),
                                topRight: Radius.circular(Dimensions.size100),
                                bottomRight:
                                    Radius.circular(Dimensions.size100),
                              ),
                              color: AppColors.main,
                            ),
                            child: InkWell(
                              onTap: () => controller.buyNow(),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/cart.svg',
                                    height: Dimensions.size16,
                                    width: Dimensions.size16,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: Dimensions.size15,
                                  ),
                                  MyText(
                                    text: 'Buy now',
                                    color: Colors.white,
                                    size: Dimensions.size14,
                                    weight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
