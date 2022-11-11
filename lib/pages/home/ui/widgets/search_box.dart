import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/core/theme/colors.dart';
import 'package:food_delivery/core/utils/dimesions.dart';
import 'package:get/get.dart';


class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
    required this.onSubmit,
    required this.onFilter,
  }) : super(key: key);
  final void Function()? onFilter;
  final void Function(String)? onSubmit;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Dimensions.size50,
      child: TextField(
        decoration: InputDecoration(
          fillColor: const Color(0xFFF9F9F9),
          filled: true,
          hintText: 'Search Food, Resturent, Drinks',
          hintStyle: TextStyle(
            fontSize: Dimensions.size14,
            fontWeight: FontWeight.w300,
            color: const Color(0xFFBBBBBC),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              Dimensions.size5,
            ),
            borderSide: BorderSide(
              color: const Color(0xFFBBBBBC).withOpacity(.5),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              Dimensions.size5,
            ),
            borderSide: const BorderSide(
              color: Color(0xFFBBBBBC),
            ),
          ),
          prefixIcon: IconButton(
            onPressed: null,
            icon: SvgPicture.asset('assets/icons/search.svg'),
          ),
          suffixIcon: IconButton(
            onPressed: onFilter,
            icon: SvgPicture.asset('assets/icons/filter.svg'),
          ),
        ),
        cursorColor: AppColors.main,
        onSubmitted: onSubmit,
      ),
    );
  }
}
