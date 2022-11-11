import 'package:food_delivery/pages/authentication/ui/index.dart';
import 'package:food_delivery/pages/food%20detail/ui/index.dart';
import 'package:food_delivery/pages/main/ui/index.dart';
import 'package:food_delivery/pages/introduction/ui/index.dart';
import 'package:food_delivery/pages/restaurant%20detail/ui/index.dart';
import 'package:food_delivery/pages/splash/ui/index.dart';
import 'package:food_delivery/pages/verify/ui/index.dart';
import 'package:food_delivery/routes/routes.dart';
import 'package:get/get.dart';

class Pages {
  static final List<GetPage<dynamic>> pages = [
    GetPage<SpalshPage>(
      name: Routes.splash,
      page: () => const SpalshPage(),
      transition: Transition.fadeIn,
      preventDuplicates: true,
    ),
    GetPage<IntroductionPage>(
      name: Routes.introduction,
      page: () => const IntroductionPage(),
      transition: Transition.leftToRight,
      preventDuplicates: true,
    ),
    GetPage<AuthPage>(
      name: Routes.auth,
      page: () => AuthPage(),
      transition: Transition.native,
      preventDuplicates: true,
    ),
    GetPage<VerifyPage>(
      name: Routes.verify,
      page: () => const VerifyPage(),
      transition: Transition.native,
      preventDuplicates: true,
    ),
    GetPage<Main>(
      name: Routes.main,
      page: () => const Main(),
      transition: Transition.native,
      preventDuplicates: true,
    ),
    GetPage<FoodDetailPage>(
      name: Routes.foodDetail,
      page: () => FoodDetailPage(),
      transition: Transition.downToUp,
      preventDuplicates: true,
    ),
    GetPage<RestaurantDetailPage>(
      name: Routes.restaurantDetail,
      page: () => RestaurantDetailPage(),
      transition: Transition.downToUp,
      preventDuplicates: true,
    ),
  ];
}


// ! Page Example

// GetPage<Example>(
//       name: Routes.initial,
//       page: () => ExampleScreen(),
//       binding: ExampleBinding(),
//       transition: Transition.fadeIn,
//       preventDuplicates: true,
//     )