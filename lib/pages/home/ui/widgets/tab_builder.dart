import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/dimesions.dart';
import 'package:food_delivery/network/models/food.dart';
import 'package:food_delivery/pages/home/ui/widgets/food_card.dart';

class HomeTabBuilder extends StatelessWidget {
  const HomeTabBuilder({
    Key? key,
    required this.items,
  }) : super(key: key);
  final List<Food> items;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (_, index) {
        Food current = items[index];
        return Container(
          margin: EdgeInsets.fromLTRB(
            index == 0 ? Dimensions.size20 : Dimensions.size10,
            0,
            index == items.length - 1 ? Dimensions.size20 : Dimensions.size10,
            0,
          ),
          child: FoodCard(food: current),
        );
      },
    );
  }
}
