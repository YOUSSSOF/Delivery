import 'package:food_delivery/network/models/food.dart';

Food newFood(int id) => Food(
      id: id,
      title: 'Pigeon Burger',
      desc:
          'A hamburger is a sandwich consisting of one or more cooked patties of ground meat, usually beef, placed inside a sliced.',
      price: 10.99,
      cover: 'assets/images/ham1.png',
      prepareTime: 25,
    );

List<Food> foods = [
  newFood(1),
  newFood(2),
  newFood(3),
  newFood(4),
  newFood(5),
];
