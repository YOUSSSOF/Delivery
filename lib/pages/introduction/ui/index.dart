import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/core/theme/colors.dart';
import 'package:food_delivery/core/utils/dimesions.dart';
import 'package:food_delivery/pages/introduction/ui/widgets/intro_banner.dart';
import 'package:food_delivery/pages/introduction/ui/widgets/my_text.dart';
import 'package:food_delivery/pages/introduction/ui/widgets/next_button.dart';
import 'package:food_delivery/routes/routes.dart';
import 'package:get/get.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({super.key});

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  final PageController controller = PageController();
  double current = 0.0;
  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        current = controller.page!;
      });
    });
    super.initState();
  }

  final List<IntrBanner> banners = const [
    IntrBanner(
      banner: 'assets/images/chef.png',
      title: 'Welcome to Khuda Lagce',
      desc:
          'A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart.',
    ),
    IntrBanner(
        banner: 'assets/images/supermarket.png',
        title: 'Choose your product',
        desc:
            'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.'),
    IntrBanner(
        banner: 'assets/images/skate.png',
        title: 'Get delivery on time',
        desc:
            'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: Dimensions.size100,
            ),
            SizedBox(
              height: Dimensions.bannerContainer,
              child: PageView.builder(
                controller: controller,
                physics: const BouncingScrollPhysics(),
                itemCount: banners.length,
                itemBuilder: (context, index) => banners[index],
              ),
            ),
            DotsIndicator(
              dotsCount: banners.length,
              position: current,
              decorator: DotsDecorator(
                size: const Size.square(7),
                activeSize: const Size(25, 7),
                activeColor: AppColors.main,
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(Dimensions.size20),
        height: Dimensions.size150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Divider(
              thickness: 1,
            ),
            current >= 1.5
                ? Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: Dimensions.size20),
                    child: InkWell(
                      onTap: () => Get.toNamed(Routes.auth),
                      borderRadius: BorderRadius.circular(Dimensions.size25),
                      child: Container(
                        height: Dimensions.size50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.main,
                          borderRadius:
                              BorderRadius.circular(Dimensions.size25),
                        ),
                        child: const Center(
                          child: MyText(
                            text: 'Get started',
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () => Get.toNamed(Routes.auth),
                        child: const MyText(
                          text: 'Skip',
                        ),
                      ),
                      NextButton(controller: controller),
                    ],
                  ),
            Container(),
          ],
        ),
      ),
    );
  }
}
