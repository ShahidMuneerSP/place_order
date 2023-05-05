class CartItem {
  int? id;
  String? title;
  double? price;
  String? image;
  int? quantity;
  int? type;
  int? iType;
  List<CustomiseModel>? customiseModel;

  CartItem(
      {this.id,
      this.title,
      this.price,
      this.image,
      this.quantity,
      this.customiseModel,
      this.type,
      this.iType});
}

class CustomiseModel {
  String? customiseImage;
  String? customiseTitle;
  double? customisePrice;
  int? customiseCount;

  CustomiseModel(
      {this.customiseImage,
      this.customiseTitle,
      this.customisePrice,
      this.customiseCount});
}
