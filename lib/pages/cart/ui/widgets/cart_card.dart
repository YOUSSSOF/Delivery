import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/dimesions.dart';
import 'package:food_delivery/network/models/cart.dart';
import 'package:food_delivery/pages/cart/controllers/cart_controller.dart';
import 'package:food_delivery/pages/food%20detail/ui/widgets/quantity_button.dart';
import 'package:food_delivery/pages/introduction/ui/widgets/my_text.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    required this.item,
    required this.controller,
  }) : super(key: key);

  final CartItem item;
  final CartController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => controller.removeFromCart(item.food),
          icon: Icon(
            Icons.close,
            size: Dimensions.size28,
          ),
        ),
        Image.asset(
          item.food.cover,
          height: Dimensions.size65,
          width: Dimensions.size65,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
              text: item.food.title,
              weight: FontWeight.w500,
            ),
            SizedBox(height: Dimensions.size10),
            MyText(
              text: item.food.showPrice,
              weight: FontWeight.w300,
            ),
          ],
        ),
        SizedBox(width: Dimensions.size15),
        QuantityButton(
          food: item.food,
          onIncrease: () => controller.addToCart(item.food),
          onDecrease: () =>
              controller.decreaseQuantityOrRemoveFromCart(item.food),
        )
      ],
    );
  }
}
