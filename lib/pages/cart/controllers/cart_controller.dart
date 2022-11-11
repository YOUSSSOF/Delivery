import 'package:food_delivery/network/models/cart.dart';
import 'package:food_delivery/network/models/food.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  Cart cart = Cart(id: 0000, items: []);

  void addToCart(Food food) {
    isIncart(food)
        ? cart.items.forEach((item) {
            item.food.id == food.id ? item.quantity += 1 : null;
          })
        : cart.items.add(
            CartItem(
              food: food,
            ),
          );
    update();
  }

  void removeFromCart(Food food) {
    cart.items
        .remove(cart.items.where((item) => item.food.id == food.id).first);
    update();
  }

  void buyNow() {
    print(cart.totalPrice);
  }

  void decreaseQuantityOrRemoveFromCart(Food food) {
    CartItem item = cart.items.where((item) => item.food.id == food.id).first;
    if (item.quantity > 1) {
      cart.items.where((item) => item.food.id == food.id).first.quantity -= 1;
    } else {
      cart.items.remove(item);
    }
    update();
  }

  bool isIncart(Food food) {
    return cart.items.firstWhereOrNull((item) => item.food.id == food.id) ==
            null
        ? false
        : true;
  }

  int? getQuantity(Food food) {
    CartItem? item =
        cart.items.firstWhereOrNull((item) => item.food.id == food.id);
    return item?.quantity;
  }

  double? getTotalPrice(Food food) {
    CartItem? item =
        cart.items.firstWhereOrNull((item) => item.food.id == food.id);
    return item == null ? 0 : (item.quantity * item.food.price);
  }
}
