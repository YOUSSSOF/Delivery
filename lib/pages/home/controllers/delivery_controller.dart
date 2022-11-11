import 'package:food_delivery/network/models/cart.dart';
import 'package:food_delivery/network/models/food.dart';
import 'package:food_delivery/network/models/restaurant.dart';
import 'package:food_delivery/pages/home/data/foods.dart';
import 'package:food_delivery/pages/home/data/restaurants.dart';
import 'package:get/get.dart';

class DeliveryController extends GetxController {
  List<Food> topHams = foods;
  List<Food> topPizzas = foods;
  List<Food> topChicks = foods;
  List<Food> topFrieses = foods;
  List<Restaurant> nearRestaurant = reses;
  void likeFood(Food food) {
    food.isLiked = !food.isLiked;
  }
}
