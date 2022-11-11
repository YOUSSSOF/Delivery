import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/core/theme/colors.dart';
import 'package:food_delivery/core/utils/dimesions.dart';
import 'package:food_delivery/network/models/food.dart';
import 'package:food_delivery/network/models/restaurant.dart';
import 'package:food_delivery/pages/introduction/ui/widgets/my_text.dart';
import 'package:food_delivery/pages/restaurant%20detail/ui/widgets/dot.dart';
import 'package:food_delivery/pages/restaurant%20detail/ui/widgets/restaurant_tab_builder.dart';
import 'package:get/get.dart';

class RestaurantDetailPage extends StatelessWidget {
  RestaurantDetailPage({super.key});

  final Restaurant restaurant = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            restaurant.backDrop,
            width: double.infinity,
            height: Dimensions.size200,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.all(Dimensions.size20),
            color: const Color(0xFFF9F9FB),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  text: restaurant.name,
                  size: Dimensions.size20,
                  weight: FontWeight.w600,
                ),
                SizedBox(
                  height: Dimensions.size10,
                ),
                Row(
                  children: [
                    MyText(
                      text: 'Fast Food',
                      size: Dimensions.size12,
                      weight: FontWeight.w300,
                    ),
                    SizedBox(
                      width: Dimensions.size10,
                    ),
                    const Dot(),
                    SizedBox(
                      width: Dimensions.size10,
                    ),
                    MyText(
                      text: 'Italiyan',
                      size: Dimensions.size12,
                      weight: FontWeight.w300,
                    ),
                  ],
                ),
                SizedBox(
                  height: Dimensions.size8,
                ),
                Row(
                  children: [
                    MyText(
                      text: '20-30 min',
                      size: Dimensions.size12,
                      weight: FontWeight.w300,
                    ),
                    SizedBox(
                      width: Dimensions.size10,
                    ),
                    const Dot(),
                    SizedBox(
                      width: Dimensions.size10,
                    ),
                    Row(
                      children: [
                        MyText(
                          text: restaurant.score.toString(),
                          size: Dimensions.size12,
                          weight: FontWeight.w300,
                        ),
                        SizedBox(
                          width: Dimensions.size5,
                        ),
                        SvgPicture.asset(
                          'assets/icons/star.svg',
                          color: Colors.yellow,
                        ),
                        SizedBox(
                          width: Dimensions.size10,
                        ),
                        const Dot(),
                        SizedBox(
                          width: Dimensions.size10,
                        ),
                        MyText(
                          text: 'Free deliver',
                          size: Dimensions.size12,
                          weight: FontWeight.w300,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: Dimensions.size15,
                ),
                const Divider(
                  color: Color(0xFFEFEFEF),
                ),
                SizedBox(
                  height: Dimensions.size15,
                ),
                MyText(
                  text: 'Restaurant info',
                  weight: FontWeight.w500,
                  size: Dimensions.size15,
                ),
                SizedBox(
                  height: Dimensions.size5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: Dimensions.size160,
                      child: MyText(
                        text: restaurant.info,
                        weight: FontWeight.w300,
                        size: Dimensions.size12,
                        maxLines: 1,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: MyText(
                        text: 'More info',
                        color: AppColors.main,
                        size: Dimensions.size12,
                        weight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: DefaultTabController(
              length: 4,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: Dimensions.size24),
                    child: TabBar(
                        indicatorWeight: 3,
                        indicatorColor: AppColors.main,
                        labelColor: Colors.black,
                        unselectedLabelColor: const Color(0xFF5F5F5F),
                        labelStyle: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: Dimensions.size18,
                          fontWeight: FontWeight.w400,
                        ),
                        unselectedLabelStyle: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: Dimensions.size14,
                          fontWeight: FontWeight.w400,
                        ),
                        tabs: const [
                          Tab(text: 'Burger'),
                          Tab(text: 'Pizza'),
                          Tab(text: 'Chicken'),
                          Tab(text: 'Fries'),
                        ]),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        RestaurantTabBuilder(
                          items: restaurant.foods,
                        ),
                          RestaurantTabBuilder(
                          items: restaurant.foods,
                        ),
                        RestaurantTabBuilder(
                          items: restaurant.foods,
                        ),
                        RestaurantTabBuilder(
                          items: restaurant.foods,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
