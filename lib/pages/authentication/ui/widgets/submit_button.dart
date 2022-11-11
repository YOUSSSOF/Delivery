import 'package:flutter/material.dart';
import 'package:food_delivery/core/theme/colors.dart';
import 'package:food_delivery/core/utils/dimesions.dart';
import 'package:food_delivery/pages/introduction/ui/widgets/my_text.dart';
import 'package:food_delivery/pages/splash/ui/widgets/loader.dart';


class SubmitButton extends StatelessWidget {
  const SubmitButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.isLoading = false,
  }) : super(key: key);
  final VoidCallback onTap;
  final String text;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? null : onTap,
      borderRadius: BorderRadius.circular(Dimensions.size25),
      child: Container(
        height: Dimensions.size70,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.main,
          borderRadius: BorderRadius.circular(Dimensions.size5),
        ),
        child: Center(
          child: isLoading
              ? const Loader()
              : MyText(
                  text: text,
                  size: 18,
                  color: Colors.white,
                ),
        ),
      ),
    );
  }
}
