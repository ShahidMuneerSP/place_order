import 'package:get/get.dart';

import '../Model/cartItem.dart';

//controller
class FoodItemTakenAwayController extends GetxController {
  CartItem selectedItem = CartItem();
  RxList selectedItems = <CartItem>[].obs;
  RxString title = "".obs;
  RxList dataList = [].obs;
  RxList data = <CartItem>[].obs;
  RxList cartItems = <CartItem>[].obs;
  RxInt cartItemCount = 0.obs;
  RxDouble totalPrice = 0.00.obs;

//add to cart
  void addToCart(
      {required String title,
      required double price,
      required String image,
      required int quantity,
      required List<CustomiseModel> customiseModel,
      required int type}) {
    final item = CartItem(
      type: type,
        title: title,
        price: price,
        image: image,
        quantity: quantity,
        customiseModel: customiseModel);
    cartItems.add(item);
    cartItemCount.value++;
  }

// remove cart
  void removeFromCart(int index) {
    cartItems.removeAt(index);
    cartItemCount.value--;
  }
}
