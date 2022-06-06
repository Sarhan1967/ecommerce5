import 'package:ecommerce5_ui/utilities/services/home_services.dart';
import 'package:ecommerce5_ui/models/category_model.dart';
import 'package:ecommerce5_ui/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/favourite_product_model .dart';

class HomeController extends GetxController {
  bool isFavourite=false;
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CategoryModel> get categoryModel => _categoryModel;
  List<CategoryModel> _categoryModel = [];

  List<ProductModel> get productModel => _productModel;
  List<ProductModel> _productModel = [];

  // List<FavouriteModel> get favouriteModel => _favouriteModel;
  // List<FavouriteModel> _favouriteModel = [];
  var items = <ProductModel>[].obs;
  //var favouriteItems = <ProductModel>[].obs;



  HomeController() {
    getCategory();
     getFavourite();
    getBestSellingProducts();
  }

  getCategory() async {
    _loading.value = true;
    HomeService().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(
            CategoryModel.fromJson(value[i].data() as Map<dynamic, dynamic>));
        _loading.value = false;
      }
      update();
    });
  }


  getFavourite() async {
    _loading.value = true;
    HomeService().getFavourite().then((value) {
      for (int i = 0; i < value.length; i++) {
        items.add(
            ProductModel.fromJson(value[i].data() as Map<dynamic, dynamic>));
        _loading.value = false;
      }
      update();
    });
  }


  getBestSellingProducts() async {
    _loading.value = true;
    HomeService().getBestSelling().then((value) {
      for (int i = 0; i < value.length; i++) {
        _productModel.add(
            ProductModel.fromJson(value[i].data() as Map<dynamic, dynamic>));
        _loading.value = false;
      }
      print(_productModel.length);
      update();
    });
  }

  void toggleFavouriteStatus(int productId) {
    _productModel[productId].isFavourite =
    !(_productModel[productId]).isFavourite;
    update();
  }
}

