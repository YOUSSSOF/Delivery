import 'package:flutter/material.dart';
import 'package:food_delivery/core/theme/colors.dart';
import 'package:food_delivery/core/utils/dimesions.dart';
import 'package:food_delivery/network/models/food.dart';
import 'package:food_delivery/pages/cart/controllers/cart_controller.dart';
import 'package:food_delivery/pages/introduction/ui/widgets/my_text.dart';
import 'package:get/get.dart';

class QuantityButton extends StatelessWidget {
  const QuantityButton({
    Key? key,
    required this.food,
    required this.onIncrease,
    required this.onDecrease,
  }) : super(key: key);
  final Food food;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.size15),
        border: Border.all(color: AppColors.main),
      ),
      child: Row(
        children: [
          IconButton(
            constraints: const BoxConstraints(),
            icon: const Icon(Icons.remove),
            onPressed: onDecrease,
            color: AppColors.main,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: Dimensions.size15,
              horizontal: Dimensions.size10,
            ),
            decoration: const BoxDecoration(
              border:
                  Border.symmetric(vertical: BorderSide(color: AppColors.main)),
            ),
            child: MyText(
              text: Get.find<CartController>().getQuantity(food).toString(),
            ),
          ),
          IconButton(
            constraints: const BoxConstraints(),
            icon: const Icon(Icons.add),
            onPressed: onIncrease,
            color: AppColors.main,
          ),
        ],
      ),
    );
  }
}
