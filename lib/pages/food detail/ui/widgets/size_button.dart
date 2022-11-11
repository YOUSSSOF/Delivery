import 'package:flutter/material.dart';
import 'package:food_delivery/core/theme/colors.dart';
import 'package:food_delivery/core/utils/dimesions.dart';
import 'package:food_delivery/network/models/food.dart';
import 'package:food_delivery/pages/introduction/ui/widgets/my_text.dart';


class SizeButton extends StatelessWidget {
  const SizeButton({
    Key? key,
    required this.currentSize,
    required this.size,
    required this.onPressed,
  }) : super(key: key);
  final FoodSize currentSize;
  final FoodSize size;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Dimensions.size45,
      height: Dimensions.size45,
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimensions.size150),
            ),
          ),
          backgroundColor: currentSize == size
              ? MaterialStateProperty.all(AppColors.main)
              : null,
        ),
        onPressed: onPressed,
        child: MyText(
          text: size.toShortString(),
          color: currentSize == size ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
