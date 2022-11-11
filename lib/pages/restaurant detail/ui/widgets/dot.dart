import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/dimesions.dart';

class Dot extends StatelessWidget {
  const Dot({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.size5,
      height: Dimensions.size5,
      decoration: BoxDecoration(
        color: const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(Dimensions.size100),
      ),
    );
  }
}
