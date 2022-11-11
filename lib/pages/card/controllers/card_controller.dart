import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/core/theme/colors.dart';
import 'package:food_delivery/pages/introduction/ui/widgets/my_text.dart';
import 'package:get/get.dart';

import 'package:food_delivery/core/utils/dimesions.dart';
import 'package:food_delivery/network/models/wallet_card.dart';

class CardController extends GetxController {
  List<WalletCard> userCards = <WalletCard>[
    WalletCard(
      cardSerial: '**** **** **** 3728',
      owner: 'Austin Hammond',
      expireDate: '02/30',
    )
  ];
  void addCard(WalletCard card) {
    userCards.add(card);
    update();
  }

  void removeCard(WalletCard card) {
    userCards.remove(card);
    update();
  }
}
