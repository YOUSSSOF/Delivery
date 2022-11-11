import 'package:food_delivery/network/models/food.dart';
import 'package:food_delivery/network/models/restaurant.dart';
import 'package:food_delivery/pages/home/data/foods.dart';

Restaurant newRes() => Restaurant(
      name: 'Pizza Hut',
      score: 4.8,
      destination: 2.3,
      cover: 'assets/images/res.png',
      backDrop: 'assets/images/backdrop.png',
      info: 'East shewrapara, 905, Mirpur …',
      openTime: '12:00am',
      closeTime: '12:am',
      foods: [
        newFood(6),
        newFood(7),
        newFood(8),
        newFood(9),
        newFood(10),
      ],
    );

List<Restaurant> reses = [
  newRes(),
  newRes(),
  newRes(),
  newRes(),
  newRes(),
];
