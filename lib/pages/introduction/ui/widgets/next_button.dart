import 'package:flutter/material.dart';
import 'package:food_delivery/core/theme/colors.dart';
import 'package:food_delivery/core/utils/dimesions.dart';
import 'package:food_delivery/pages/introduction/ui/widgets/my_text.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Dimensions.size120,
      height: Dimensions.size50,
      child: InkWell(
        onTap: () => controller.nextPage(
          duration: const Duration(milliseconds: 200),
          curve: Curves.bounceIn,
        ),
        borderRadius: BorderRadius.circular(Dimensions.size25),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(Dimensions.size15),
              decoration: BoxDecoration(
                  color: AppColors.main,
                  borderRadius: BorderRadius.circular(Dimensions.size25)),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: 'Next',
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              width: Dimensions.size10,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.mainDarker,
                  borderRadius: BorderRadius.circular(Dimensions.size100),
                ),
                padding: EdgeInsets.all(Dimensions.size10),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
