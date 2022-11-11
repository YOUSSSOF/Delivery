import 'dart:convert';

import 'package:food_delivery/network/models/food.dart';

class Cart {
  int id;
  List<CartItem> items;
  get totalPrice => 100;

  Cart({
    required this.id,
    required this.items,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'items': items.map((x) => x.toMap()).toList()});

    return result;
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      id: map['id']?.toInt() ?? 0,
      items: List<CartItem>.from(map['items']?.map((x) => Food.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) => Cart.fromMap(json.decode(source));
}

class CartItem {
  Food food;
  int quantity;
  CartItem({
    required this.food,
    this.quantity = 1,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'food': food.toMap()});
    result.addAll({'quantity': quantity});

    return result;
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      food: Food.fromMap(map['food']),
      quantity: map['quantity']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartItem.fromJson(String source) =>
      CartItem.fromMap(json.decode(source));
}
