import 'dart:convert';

enum FoodSize { S, M, L }

extension ParseToString on FoodSize {
  String toShortString() {
    return toString().split('.').last;
  }
}

class Food {
  int id;
  String title;
  String desc;
  double price;
  String cover;
  int prepareTime;
  FoodSize size;
  bool isLiked;
  Food({
    required this.id,
    required this.title,
    required this.desc,
    required this.price,
    required this.cover,
    required this.prepareTime,
    this.size = FoodSize.M,
    this.isLiked = false,
  });
  get showPrice =>
      '\$${price.toStringAsFixed(1).split('.')[0]},${price.toStringAsFixed(1).split('.')[1]}';
  set changeSize(FoodSize newSize) => size = newSize;
  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'title': title});
    result.addAll({'desc': desc});
    result.addAll({'price': price});
    result.addAll({'cover': cover});
    result.addAll({'prepareTime': prepareTime});

    return result;
  }

  factory Food.fromMap(Map<String, dynamic> map) {
    return Food(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      desc: map['desc'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      cover: map['cover'] ?? '',
      prepareTime: map['prepareTime']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Food.fromJson(String source) => Food.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Food(title: $title, desc: $desc, price: $price, cover: $cover, prepareTime: $prepareTime, size: ${size.toShortString()})';
  }
}
