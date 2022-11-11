import 'package:flutter/material.dart';
import 'package:food_delivery/core/theme/colors.dart';
import 'package:food_delivery/core/utils/dimesions.dart';
import 'package:food_delivery/pages/introduction/ui/widgets/my_text.dart';


class ListItem extends StatelessWidget {
  const ListItem({
    Key? key,
    required this.text,
    required this.onPressed,
    this.seprated = true,
  }) : super(key: key);
  final String text;
  final VoidCallback onPressed;
  final bool seprated;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF9F9F9),
      padding: EdgeInsets.symmetric(horizontal: Dimensions.size25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                text: text,
                weight: FontWeight.w300,
              ),
              IconButton(
                onPressed: onPressed,
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.lightGrey,
                ),
                iconSize: Dimensions.size20,
              ),
            ],
          ),
          seprated
              ? const Divider(
                  thickness: .25,
                  color: Color(0xFFDFDFDF),
                  height: 5,
                )
              : Container(),
        ],
      ),
    );
  }
}
