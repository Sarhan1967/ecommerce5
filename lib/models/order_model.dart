import 'cart_product_model.dart';

class OrderModel {
  String? userId, dateTime;
  Address? address;
  List<CartProductModel>? products;

  OrderModel({required this.userId, required this.dateTime, required this.address, required this.products});

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return new OrderModel(
      userId: map['userId'] as String?,
      dateTime: map['dateTime'] as String?,
      address: map['address'] as Address?,
      products: map['products'] as List<CartProductModel>?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': this.userId,
      'dateTime': this.dateTime,
      'address': this.address,
      'products': this.products,
    } as Map<String, dynamic>;
  }
}

class Address {
  String? street1, street2, city, state, country;

  Address({required this.street1, required this.street2, required this.city, required this.state, required this.country});

  factory Address.fromMap(Map<String, dynamic> map) {
    return new Address(
      street1: map['street1'] as String?,
      street2: map['street2'] as String?,
      state: map['state'] as String?,
      city: map['city'] as String?,
      country: map['country'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'street1': this.street1,
      'street2': this.street2,
      'state': this.state,
      'city': this.city,
      'country': this.country,
    } as Map<String, dynamic>;
  }
}
