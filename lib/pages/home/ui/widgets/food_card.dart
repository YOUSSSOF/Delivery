import 'package:flutter/material.dart';
import 'package:food_delivery/core/theme/colors.dart';
import 'package:food_delivery/core/utils/dimesions.dart';
import 'package:food_delivery/network/models/food.dart';
import 'package:food_delivery/pages/introduction/ui/widgets/my_text.dart';
import 'package:food_delivery/routes/routes.dart';
import 'package:get/get.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({
    Key? key,
    required this.food,
  }) : super(key: key);

  final Food food;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: Dimensions.itemCardHeight,
          width: Dimensions.itemCardWidth,
          margin: EdgeInsets.only(top: Dimensions.size30),
          decoration: BoxDecoration(
              color: const Color(0xFFFAFCFD),
              borderRadius: BorderRadius.circular(Dimensions.size25)),
          padding: EdgeInsets.all(Dimensions.size25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: food.id,
                child: Image.asset(
                  food.cover,
                  height: Dimensions.size130,
                  width: Dimensions.size150,
                ),
              ),
              SizedBox(
                height: Dimensions.size30,
              ),
              MyText(
                text: food.title,
                weight: FontWeight.w500,
                maxLines: 1,
                textOverflow: TextOverflow.ellipsis,
                align: TextAlign.left,
              ),
              SizedBox(
                height: Dimensions.size5,
              ),
              MyText(
                text: food.desc,
                size: Dimensions.size12,
                weight: FontWeight.w300,
                maxLines: 1,
                align: TextAlign.left,
                color: AppColors.lightGrey,
              ),
              SizedBox(
                height: Dimensions.size15,
              ),
              MyText(
                text: food.showPrice,
                weight: FontWeight.w500,
              ),
            ],
          ),
        ),
        Positioned(
          right: Dimensions.size15,
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.main,
              borderRadius: BorderRadius.circular(100),
            ),
            child: IconButton(
              constraints: const BoxConstraints(),
              onPressed: () => Get.toNamed(Routes.foodDetail, arguments: food),
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: Dimensions.size15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
