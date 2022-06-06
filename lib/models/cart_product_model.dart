
import 'package:ecommerce5_ui/utilities/helpers/extension.dart';
import 'package:flutter/cupertino.dart';

class CartProductModel {
  String? name, image, price,productId;
  int? quantity;

  CartProductModel({this.name, this.image, this.quantity, this.price,this.productId,}
      ); // ProductModel(

  CartProductModel.fromJson(Map<dynamic, dynamic> map) {
    // if (map == null) {
    //   return;
    // }

    name = map['name'];
    image = map['image'];
    quantity = map['quantity'];
    price = map['price'];
    productId = map['productId'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'quantity': quantity,
      'price': price,
      'productId':productId,
    };
  }
}
