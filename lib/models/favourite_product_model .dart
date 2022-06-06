
import 'package:ecommerce5_ui/utilities/helpers/extension.dart';
import 'package:flutter/cupertino.dart';

class FavouriteModel {
  String? name, image, price,productId;
  bool isFavourite=false;
  //int? quantity;

  FavouriteModel({this.name, this.image, required this.isFavourite, this.price,this.productId,}
      ); // ProductModel(

  FavouriteModel.fromJson(Map<dynamic, dynamic> map) {
    // if (map == null) {
    //   return;
    // }

    name = map['name'];
    image = map['image'];
    isFavourite = map['isFavourite'];
    price = map['price'];
    productId = map['productId'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'isFavourite': isFavourite,
      'price': price,
      'productId':productId,
    };
  }
}
