import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/pages/food%20detail/ui/widgets/quantity_button.dart';
import 'package:get/get.dart';

import 'package:food_delivery/core/theme/colors.dart';
import 'package:food_delivery/core/utils/dimesions.dart';
import 'package:food_delivery/network/models/food.dart';
import 'package:food_delivery/pages/cart/controllers/cart_controller.dart';
import 'package:food_delivery/pages/food%20detail/ui/widgets/size_button.dart';
import 'package:food_delivery/pages/home/controllers/delivery_controller.dart';
import 'package:food_delivery/pages/introduction/ui/widgets/my_text.dart';

class FoodDetailPage extends StatefulWidget {
  FoodDetailPage({super.key});

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  final Food food = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.size20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                    iconSize: Dimensions.size16,
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        Get.find<DeliveryController>().likeFood(food);
                      });
                    },
                    icon: SvgPicture.asset('assets/icons/heart.svg',
                        color: food.isLiked ? Colors.red : Colors.black),
                    iconSize: Dimensions.size16,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Dimensions.size20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.size50,
              ),
              child: Hero(
                tag: food.id,
                child: Image.asset(
                  food.cover,
                  height: Dimensions.foodDetailBannerHeight,
                  width: Dimensions.foodDetailBannerWidth,
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.size50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizeButton(
                  size: FoodSize.S,
                  currentSize: food.size,
                  onPressed: () {
                    setState(() {
                      food.changeSize = FoodSize.S;
                    });
                  },
                ),
                SizedBox(
                  width: Dimensions.size35,
                ),
                SizeButton(
                  size: FoodSize.M,
                  currentSize: food.size,
                  onPressed: () {
                    setState(() {
                      food.changeSize = FoodSize.M;
                    });
                  },
                ),
                SizedBox(
                  width: Dimensions.size35,
                ),
                SizeButton(
                  size: FoodSize.L,
                  currentSize: food.size,
                  onPressed: () {
                    setState(() {
                      food.changeSize = FoodSize.L;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: Dimensions.size40,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.size20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    text: food.title,
                    weight: FontWeight.w900,
                    size: Dimensions.size20,
                    maxLines: 1,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/clock.svg',
                        height: Dimensions.size16,
                        width: Dimensions.size16,
                      ),
                      SizedBox(
                        width: Dimensions.size15,
                      ),
                      MyText(
                        text: '${food.prepareTime.toString()} Mins',
                        size: Dimensions.size12,
                        weight: FontWeight.w500,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Dimensions.size25,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.size20),
              child: MyText(
                text: food.desc,
                align: TextAlign.left,
                size: Dimensions.size18,
                weight: FontWeight.w300,
                lineHeight: 1.5,
                maxLines: 5,
                textOverflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: Dimensions.size60,
        margin: EdgeInsets.only(
          bottom: Dimensions.size40,
          left: Dimensions.size20,
          right: Dimensions.size20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MyText(
                  text: 'Total price',
                  color: AppColors.lightGrey,
                  weight: FontWeight.w300,
                ),
                SizedBox(
                  height: Dimensions.size10,
                ),
                MyText(
                  text:
                      Get.find<CartController>().getTotalPrice(food).toString(),
                  size: Dimensions.size18,
                  weight: FontWeight.w900,
                ),
              ],
            ),
            Get.find<CartController>().isIncart(food)
                ? QuantityButton(
                    food: food,
                    onIncrease: () {
                      setState(() {
                        Get.find<CartController>().addToCart(food);
                      });
                    },
                    onDecrease: () {
                      setState(() {
                        Get.find<CartController>()
                            .decreaseQuantityOrRemoveFromCart(food);
                      });
                    },
                  )
                : Container(
                    padding: EdgeInsets.all(Dimensions.size20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.size45),
                        topRight: Radius.circular(Dimensions.size100),
                        bottomRight: Radius.circular(Dimensions.size100),
                      ),
                      color: AppColors.main,
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          Get.find<CartController>().addToCart(food);
                        });
                      },
                      child: Row(
                        children: [
                          MyText(
                            text: 'Add to Cart',
                            color: Colors.white,
                            size: Dimensions.size14,
                            weight: FontWeight.w500,
                          ),
                          SizedBox(
                            width: Dimensions.size10,
                          ),
                          SvgPicture.asset(
                            'assets/icons/add.svg',
                            height: Dimensions.size16,
                            width: Dimensions.size16,
                          ),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
