
import 'dart:ffi';
import 'dart:ui';

import 'package:ecommerce5_ui/utilities/helpers/extension.dart';

class ProductModel {
  String? name, image, description, sized, productId,price, rating;
  Color? color;
  late bool isFavourite, isPopular;

  ProductModel(
      {this.name,
      this.image,
      this.description,
      this.color,
      this.sized,
      required this.price,
      this.productId,
      this.rating,
      this.isFavourite = false,
      this.isPopular = false,
      });

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }

    name = map['name'];
    image = map['image'];
    description = map['description'];
    color = HexColor.fromHex(map['color']);
    sized = map['sized'];
    price = map['price'];
    productId = map['productId'];
    isFavourite= map['isFavourite'];
    isPopular= map['isPopular'];
    rating= map['rating'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'color': color,
      'sized': sized,
      'price': price,
      'productId': productId,
      'isFavourite': isFavourite,
      'isPopular': isPopular,
      'rating': rating,
    };
  }
}
