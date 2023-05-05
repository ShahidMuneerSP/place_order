import 'dart:math';

import 'package:red_hot_twister_app/Model/cartItem.dart';

double calculateItemPrice(CartItem? item) {
  double price = 0.00;
  price = price + ((item?.price ?? 0.00) * (item?.quantity ?? 0));
  for (var element in item?.customiseModel ?? []) {
    price = price + (element.customisePrice * element.customiseCount);
    log(price);
  }
  return price;
}
