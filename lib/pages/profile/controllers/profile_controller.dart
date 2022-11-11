import 'package:food_delivery/network/models/user.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  User currentUser = User(
    username: 'Yousof',
    email: 'yousofh255@gmail.com',
    profile: 'assets/images/profile.png',
  );
}
