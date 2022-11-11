import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:food_delivery/core/utils/dimesions.dart';
import 'package:food_delivery/pages/introduction/ui/widgets/my_text.dart';
import 'package:food_delivery/pages/profile/controllers/profile_controller.dart';
import 'package:food_delivery/pages/profile/ui/widgets/list_item.dart';
import 'package:get/get.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Dimensions.screenWidth,
      child: Column(
        children: [
          SizedBox(
            height: Dimensions.size30,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(Dimensions.size100),
            child: Image.asset(
              controller.currentUser.profile ?? 'assets/images/blank.jpg',
              height: Dimensions.size80,
              width: Dimensions.size80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: Dimensions.size15,
          ),
          MyText(
            text: controller.currentUser.username,
            size: Dimensions.size18,
            weight: FontWeight.w500,
          ),
          SizedBox(
            height: Dimensions.size5,
          ),
          MyText(
            text: controller.currentUser.email,
            size: Dimensions.size12,
            weight: FontWeight.w300,
          ),
          SizedBox(
            height: Dimensions.size40,
          ),
          ListItem(
            text: 'Name, Phone Number, Email',
            onPressed: () {},
          ),
          ListItem(
            text: 'Password & Security',
            onPressed: () {},
          ),
          ListItem(
            text: 'Payment & Shipping',
            onPressed: () {},
            seprated: false,
          ),
          SizedBox(
            height: Dimensions.size20,
          ),
          ListItem(
            text: 'Offer & Promos',
            onPressed: () {},
          ),
          ListItem(
            text: 'Get Discount',
            onPressed: () {},
            seprated: false,
          ),
          SizedBox(
            height: Dimensions.size20,
          ),
          ListItem(
            text: 'Language',
            onPressed: () {},
            seprated: false,
          ),
          SizedBox(
            height: Dimensions.size20,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              width: Dimensions.screenWidth,
              height: Dimensions.size60,
              color: const Color(0xFFF9F9F9),
              padding: EdgeInsets.symmetric(horizontal: Dimensions.size25),
              child: const Center(
                child: MyText(
                  text: 'Sign Out',
                  weight: FontWeight.w300,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
