import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/pages/main/controllers/bottom_navigator_controller.dart';
import 'package:food_delivery/pages/profile/controllers/profile_controller.dart';
import 'package:food_delivery/routes/routes.dart';
import 'package:get/get.dart';
import 'package:food_delivery/core/theme/colors.dart';
import 'package:food_delivery/core/utils/dimesions.dart';
import 'package:food_delivery/network/models/restaurant.dart';
import 'package:food_delivery/pages/authentication/controllers/auth_controller.dart';
import 'package:food_delivery/pages/home/controllers/delivery_controller.dart';
import 'package:food_delivery/pages/home/controllers/search_controller.dart';
import 'package:food_delivery/pages/home/ui/widgets/search_box.dart';
import 'package:food_delivery/pages/home/ui/widgets/tab_builder.dart';
import 'package:food_delivery/pages/introduction/ui/widgets/my_text.dart';

class HomePage extends GetView<DeliveryController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: Dimensions.size24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.size24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: 'Good Morning',
                          size: Dimensions.size12,
                          weight: FontWeight.w300,
                        ),
                        SizedBox(
                          height: Dimensions.size5,
                        ),
                        MyText(
                          text: Get.find<ProfileController>()
                              .currentUser
                              .username,
                          size: Dimensions.size18,
                          weight: FontWeight.w500,
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () =>
                          Get.find<BottomNavigatorController>().changeIndex(2),
                      icon: SvgPicture.asset(
                        'assets/icons/cart.svg',
                        height: Dimensions.size18,
                        width: Dimensions.size18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Dimensions.size30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.size24),
                child: SearchBox(
                  onSubmit: Get.find<SearchController>().onSearch,
                  onFilter: Get.find<SearchController>().onFilter,
                ),
              ),
              SizedBox(
                height: Dimensions.size30,
              ),
              DefaultTabController(
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
                    SizedBox(
                      height: Dimensions.tabViewHeight - Dimensions.size10,
                      child: TabBarView(
                        children: [
                          HomeTabBuilder(items: controller.topHams),
                          HomeTabBuilder(items: controller.topPizzas),
                          HomeTabBuilder(items: controller.topChicks),
                          HomeTabBuilder(items: controller.topFrieses),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Dimensions.size20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.size24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                      text: 'Near You',
                      size: Dimensions.size22,
                      weight: FontWeight.w500,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: MyText(
                        text: 'View All',
                        color: const Color(0xFF5F5F5F),
                        size: Dimensions.size14,
                        weight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 75,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: Dimensions.size10),
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.nearRestaurant.length,
                    itemBuilder: (_, index) {
                      Restaurant current = controller.nearRestaurant[index];
                      return GestureDetector(
                        onTap: () => Get.toNamed(Routes.restaurantDetail,
                            arguments: current),
                        child: Container(
                          margin: EdgeInsets.fromLTRB(
                            index == 0 ? Dimensions.size20 : Dimensions.size10,
                            Dimensions.size5,
                            index == controller.nearRestaurant.length - 1
                                ? Dimensions.size20
                                : Dimensions.size10,
                            0,
                          ),
                          padding: EdgeInsets.fromLTRB(
                            Dimensions.size10,
                            Dimensions.size8,
                            Dimensions.size40,
                            Dimensions.size10,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF8F8FA),
                            borderRadius:
                                BorderRadius.circular(Dimensions.size10),
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.size10),
                                child: Image.asset(
                                  current.cover,
                                  height: Dimensions.size55,
                                  width: Dimensions.size55,
                                ),
                              ),
                              SizedBox(
                                width: Dimensions.size10,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText(
                                    text: current.name,
                                    size: Dimensions.size14,
                                    weight: FontWeight.w500,
                                  ),
                                  MyText(
                                    text:
                                        '${current.openTime} - ${current.closeTime}',
                                    color: AppColors.lightGrey,
                                    size: Dimensions.size10,
                                    weight: FontWeight.w300,
                                  ),
                                  Row(
                                    children: [
                                      CardIcon(
                                        icon: 'assets/icons/star.svg',
                                        text: current.score.toString(),
                                      ),
                                      SizedBox(
                                        width: Dimensions.size15,
                                      ),
                                      CardIcon(
                                        icon: 'assets/icons/km.svg',
                                        text: current.destination.toString(),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardIcon extends StatelessWidget {
  const CardIcon({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(icon),
        SizedBox(
          width: Dimensions.size5,
        ),
        MyText(
          text: text,
          size: Dimensions.size8,
          weight: FontWeight.w500,
        ),
      ],
    );
  }
}
