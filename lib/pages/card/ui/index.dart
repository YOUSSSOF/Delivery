import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/core/theme/colors.dart';
import 'package:food_delivery/core/utils/dimesions.dart';
import 'package:food_delivery/network/models/wallet_card.dart';
import 'package:food_delivery/pages/card/controllers/card_controller.dart';
import 'package:food_delivery/pages/card/ui/widgets/card_form_field.dart';
import 'package:food_delivery/pages/card/ui/widgets/wallet_card_item.dart';
import 'package:food_delivery/pages/introduction/ui/widgets/my_text.dart';
import 'package:get/get.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  void dispose() {
    cardNumberController.dispose();
    cardNameController.dispose();
    cardExpireDateController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    cardNumberController = TextEditingController(text: '');
    cardNameController = TextEditingController(text: '');
    cardExpireDateController = TextEditingController(text: '');
    super.initState();
  }

  late TextEditingController cardNumberController;
  late TextEditingController cardNameController;
  late TextEditingController cardExpireDateController;

  void addCardHandler() {
    Get.bottomSheet(
      Container(
        width: Dimensions.screenWidth,
        margin: EdgeInsets.symmetric(
          horizontal: Dimensions.size20,
          vertical: Dimensions.size50,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFF9F9F9),
          borderRadius: BorderRadius.circular(Dimensions.size10),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              CardFormFiled(
                placeHolder: 'Name on card',
                controller: cardNameController,
              ),
              CardFormFiled(
                placeHolder: 'Card number',
                controller: cardNumberController,
              ),
              CardFormFiled(
                placeHolder: 'MM/YY',
                controller: cardExpireDateController,
              ),
              Container(
                margin: EdgeInsets.all(Dimensions.size5),
                child: ElevatedButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor: MaterialStateProperty.all(AppColors.main),
                  ),
                  onPressed: () {
                    WalletCard card = WalletCard(
                      cardSerial: cardNumberController.text,
                      owner: cardNameController.text,
                      expireDate: cardExpireDateController.text,
                    );
                    Get.find<CardController>().addCard(card);
                    cardNumberController.text = '';
                    cardNameController.text = '';
                    cardExpireDateController.text = '';
                    Get.back();
                  },
                  child: const MyText(
                    text: 'Save Card',
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          Dimensions.size20,
          Dimensions.size30,
          Dimensions.size20,
          0,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(
                  text: 'Wallet',
                  size: Dimensions.size24,
                  weight: FontWeight.w900,
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () => addCardHandler(),
                  icon: SvgPicture.asset(
                    'assets/icons/add.svg',
                    height: Dimensions.size25,
                    width: Dimensions.size25,
                    fit: BoxFit.cover,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Dimensions.size30,
            ),
            GetBuilder<CardController>(builder: (_) {
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: Get.find<CardController>().userCards.length,
                itemBuilder: (_, index) {
                  WalletCard current =
                      Get.find<CardController>().userCards[index];
                  return WalletCardItem(card: current);
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
