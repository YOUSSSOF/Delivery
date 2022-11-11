import 'package:flutter/material.dart';

import 'package:food_delivery/core/theme/colors.dart';
import 'package:food_delivery/core/utils/dimesions.dart';
import 'package:food_delivery/pages/introduction/ui/widgets/my_text.dart';

class IntrBanner extends StatelessWidget {
  const IntrBanner({
    Key? key,
    required this.banner,
    required this.title,
    required this.desc,
  }) : super(key: key);
  
  final String banner;
  final String title;
  final String desc;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
         banner,
          height: Dimensions.bannerHeight,
          width: double.infinity,
        ),
        SizedBox(
          height: Dimensions.size60,
        ),
        MyText(
          text:title,
          size: Dimensions.size24,
          weight: FontWeight.w500,
        ),
        SizedBox(
          height: Dimensions.size15,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.size40),
          child: MyText(
            text:
            desc,
            color: AppColors.textBody1,
            lineHeight: 1.5,
            align: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
