import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:food_delivery/core/theme/colors.dart';
import 'package:food_delivery/core/utils/dimesions.dart';
import 'package:food_delivery/network/models/food.dart';
import 'package:food_delivery/pages/home/ui/widgets/food_card.dart';
import 'package:food_delivery/pages/introduction/ui/widgets/my_text.dart';

class RestaurantTabBuilder extends StatefulWidget {
  const RestaurantTabBuilder({
    Key? key,
    required this.items,
  }) : super(key: key);
  final List<Food> items;

  @override
  State<RestaurantTabBuilder> createState() => _RestaurantTabBuilderState();
}

class _RestaurantTabBuilderState extends State<RestaurantTabBuilder> {
  final List<Food> selectedItems = [];
  void selectFood(Food food) => setState(() {
        selectedItems.add(food);
      });

  void unselectFood(Food food) => setState(() {
        selectedItems.remove(food);
      });

  bool isSelected(Food food) => selectedItems.contains(food);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: widget.items.length,
          itemBuilder: (_, index) {
            Food current = widget.items[index];
            return FoodListItem(
              current: current,
              onPressed: () => isSelected(current)
                  ? unselectFood(current)
                  : selectFood(current),
              icon: isSelected(current) ? Icons.check : Icons.add,
            );
          },
        ),
        if (selectedItems.isNotEmpty)
          Positioned(
            bottom: Dimensions.size15,
            left: Dimensions.size20,
            right: Dimensions.size20,
            child: Container(
              color: AppColors.main,
              height: Dimensions.size70,
              width: Dimensions.screenWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MyText(
                    text: '${selectedItems.length} selected',
                    size: Dimensions.size14,
                    weight: FontWeight.w300,
                    color: Colors.white,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const MyText(
                      text: 'Checkout        ',
                      weight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  const MyText(
                    text: '\$100',
                    weight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          )
        else
          Container(),
      ],
    );
  }
}

class FoodListItem extends StatelessWidget {
  const FoodListItem({
    Key? key,
    required this.current,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);
  final Food current;
  final VoidCallback onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.size130,
      padding: EdgeInsets.all(Dimensions.size20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(Dimensions.size10),
                child: Image.asset(
                  current.cover,
                  height: Dimensions.size90,
                  width: Dimensions.size90,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: Dimensions.size30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MyText(
                    text: current.title,
                    weight: FontWeight.w900,
                  ),
                  MyText(
                    text: current.showPrice,
                    weight: FontWeight.w500,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: Dimensions.size30,
            width: Dimensions.size30,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColors.main),
                elevation: MaterialStateProperty.all(0),
                padding: MaterialStateProperty.all(EdgeInsets.zero),
              ),
              onPressed: onPressed,
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
