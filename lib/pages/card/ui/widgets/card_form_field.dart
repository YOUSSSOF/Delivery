import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/dimesions.dart';


class CardFormFiled extends StatelessWidget {
  const CardFormFiled({
    Key? key,
    required this.placeHolder,
    this.controller,
  }) : super(key: key);
  final String placeHolder;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.size20),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.size10),
            borderSide: const BorderSide(color: Colors.white, width: 0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.size10),
            borderSide: const BorderSide(color: Colors.white, width: 0),
          ),
          hintText: placeHolder,
          hintStyle: TextStyle(
            fontSize: Dimensions.size14,
            fontWeight: FontWeight.w300,
            color: const Color(0xFFBBBBBC),
          ),
        ),
        cursorColor: Colors.black,
      ),
    );
  }
}
