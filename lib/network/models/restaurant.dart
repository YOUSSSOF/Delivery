import 'dart:convert';

import 'package:food_delivery/network/models/food.dart';

class Restaurant {
  String name;
  double score;
  double destination;
  String cover;
  String backDrop;
  String info;
  String openTime;
  String closeTime;
  List<Food> foods;
  Restaurant({
    required this.name,
    required this.score,
    required this.destination,
    required this.cover,
    required this.backDrop,
    required this.info,
    required this.openTime,
    required this.closeTime,
    required this.foods,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'name': name});
    result.addAll({'score': score});
    result.addAll({'destination': destination});
    result.addAll({'cover': cover});
    result.addAll({'backDrop': backDrop});
    result.addAll({'info': info});
    result.addAll({'openTime': openTime});
    result.addAll({'closeTime': closeTime});
    result.addAll({'foods': foods.map((x) => x.toMap()).toList()});
  
    return result;
  }

  factory Restaurant.fromMap(Map<String, dynamic> map) {
    return Restaurant(
      name: map['name'] ?? '',
      score: map['score']?.toDouble() ?? 0.0,
      destination: map['destination']?.toDouble() ?? 0.0,
      cover: map['cover'] ?? '',
      backDrop: map['backDrop'] ?? '',
      info: map['info'] ?? '',
      openTime: map['openTime'] ?? '',
      closeTime: map['closeTime'] ?? '',
      foods: List<Food>.from(map['foods']?.map((x) => Food.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Restaurant.fromJson(String source) =>
      Restaurant.fromMap(json.decode(source));
}
