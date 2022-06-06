import 'dart:core';

import 'package:get/get.dart';

import '../models/item_model.dart';

class WishlistController extends GetxController {

   //var wishlistItems = List<Item>().obs;
   var wishlistItems = <ItemModel>[].obs;
   int get itemCount => wishlistItems.length;

  void addItem(ItemModel item) {
    wishlistItems.add(item);
  }

  void remove(ItemModel item) {
    wishlistItems.remove(item);
  }
}
