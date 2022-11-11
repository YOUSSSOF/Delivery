import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/core/utils/dimesions.dart';


class BottomNavigationBarItemIcon extends StatelessWidget {
  const BottomNavigationBarItemIcon({
    Key? key,
    required this.icon,
    required this.index,
    required this.current,
  }) : super(key: key);
  final String icon;
  final int index;
  final int current;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.size15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.size28),
        color: current == index ? Colors.white.withOpacity(.3) : null,
      ),
      child: SvgPicture.asset(
        icon,
        height: Dimensions.size16,
        width: Dimensions.size16,
        color: Colors.white,
      ),
    );
  }
}
