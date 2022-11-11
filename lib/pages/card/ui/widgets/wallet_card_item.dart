import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/dimesions.dart';
import 'package:food_delivery/network/models/wallet_card.dart';
import 'package:food_delivery/pages/card/controllers/card_controller.dart';
import 'package:food_delivery/pages/introduction/ui/widgets/my_text.dart';
import 'package:get/get.dart';

class WalletCardItem extends StatelessWidget {
  const WalletCardItem({
    Key? key,
    required this.card,
  }) : super(key: key);
  final WalletCard card;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => Get.find<CardController>().removeCard(card),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.size10),
            ),
            height: Dimensions.cardHeight,
            width: Dimensions.screenWidth,
            child: Center(
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/card.png',
                    height: Dimensions.cardHeight,
                  ),
                  Positioned(
                    left: Dimensions.size20,
                    top: Dimensions.size65,
                    child: MyText(
                      text: card.cardSerial,
                      color: Colors.white,
                      size: Dimensions.size24,
                    ),
                  ),
                  Positioned(
                    bottom: Dimensions.size30,
                    left: Dimensions.size20,
                    child: MyText(
                      text: card.owner,
                      color: Colors.white,
                      size: Dimensions.size14,
                      weight: FontWeight.w700,
                    ),
                  ),
                  Positioned(
                    bottom: Dimensions.size30,
                    right: Dimensions.size140,
                    child: MyText(
                      text: card.expireDate,
                      color: Colors.white,
                      size: Dimensions.size14,
                      weight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: Dimensions.size30,
          ),
        ],
      ),
    );
  }
}
