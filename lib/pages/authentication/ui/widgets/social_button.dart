import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/core/theme/colors.dart';
import 'package:food_delivery/core/utils/dimesions.dart';
import 'package:food_delivery/pages/introduction/ui/widgets/my_text.dart';


class SocialButton extends StatelessWidget {
  const SocialButton({
    Key? key,
    required this.icon,
    required this.name,
    required this.onTap,
  }) : super(key: key);

  final String icon;
  final String name;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(Dimensions.size8),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.size45,
          vertical: Dimensions.size12,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFFE6E6E6),
          ),
          borderRadius: BorderRadius.circular(Dimensions.size8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset(
              icon,
              height: Dimensions.size35,
              width: Dimensions.size35,
            ),
            MyText(
              text: 'Continue with $name',
              size: Dimensions.size18,
              color: AppColors.textBody3,
            ),
            Container(),
          ],
        ),
      ),
    );
  }
}
