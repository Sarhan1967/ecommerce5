import 'package:get/get.dart';
import '../models/product_model.dart';
class FavouriteController extends GetxController {

  //var wishlistItems = List<Item>().obs;
  var favouriteModel = <ProductModel>[].obs;
  int get itemCount => favouriteModel.length;

  void addItem(ProductModel item) {
    favouriteModel.add(item);
  }

  void remove(ProductModel item) {
    favouriteModel.remove(item);
  }
}


// class FavouriteController extends GetxController {
//   ValueNotifier<bool> get loading => _loading;
//   ValueNotifier<bool> _loading = ValueNotifier(false);
//
//   List<ProductModel> _favouriteProductModel = [].obs as List<ProductModel>;
//
//   List<ProductModel> get favouriteProductModel =>
//       _favouriteProductModel;
//
//   int get itemCount => favouriteProductModel.length;
//
//
//
//
//
//
//   // double get totalPrice => _totalPrice;
//   // double _totalPrice = 0.0;
//   var dbHelper = FavouriteDatbaseHelper.db;
//
//   FavouriteController() {
//     getAllProduct();
//   }
//
//   getAllProduct() async {
//     _loading.value = true;
//
//     _favouriteProductModel = (await dbHelper.getAllProduct())!;
//     print(_favouriteProductModel.length);
//
//     _loading.value = false;
//
//     update();
//   }
//
//   addProduct(FavouriteProductModel favouriteProductModel) async {
//     for (int i = 0; i < _favouriteProductModel.length; i++) {
//       if (_favouriteProductModel[i].productId ==
//           favouriteProductModel.productId) {
//         return;
//       }
//     }
//     var dbHelper = FavouriteDatbaseHelper.db;
//     await dbHelper.insert(favouriteProductModel);
//     _favouriteProductModel.add(favouriteProductModel);
//     // _totalPrice += (double.parse(favouriteProductModel.price!) *
//     //     favouriteProductModel.quantity!);
//
//     update();
//   }
//   void toggleFavouriteStatus(int productId) {
//     _favouriteProductModel[productId].isFavourite =
//     !(_favouriteProductModel[productId]).isFavourite;
//     update();
//
//   }
// }

// class WishlistController extends GetxController
/*
// class WishlistController extends GetxController {
//
//   //var wishlistItems = List<Item>().obs;
//   var wishlistItems = <ItemModel>[].obs;
//   int get itemCount => wishlistItems.length;
//
//   void addItem(ItemModel item) {
//     wishlistItems.add(item);
//   }
//
//   void remove(ItemModel item) {
//     wishlistItems.remove(item);
//   }
// }
 */


//
//
// class FavouriteController extends GetxController {
//   ValueNotifier<bool> get loading => _loading;
//   ValueNotifier<bool> _loading = ValueNotifier(false);
//
//   List<FavouriteProductModel> _favouriteProductModel = [];
//
//   List<FavouriteProductModel> get favouriteProductModel => _favouriteProductModel;
//
//   // double get totalPrice => _totalPrice;
//   // double _totalPrice = 0.0;
//   var dbHelper = FavouriteDatbaseHelper.db;
//
//   FavouriteController() {
//     getAllProduct();
//   }
//
//   getAllProduct() async {
//     _loading.value = true;
//
//     _favouriteProductModel = (await dbHelper.getAllProduct())!;
//     print(_favouriteProductModel.length);
//
//     _loading.value = false;
//
//     update();
//   }
//
//   addProduct(FavouriteProductModel favouriteProductModel) async {
//     for (int i = 0; i < _favouriteProductModel.length; i++) {
//       if (_favouriteProductModel[i].productId == favouriteProductModel.productId) {
//         return;
//       }
//     }
//     var dbHelper = FavouriteDatbaseHelper.db;
//     await dbHelper.insert(favouriteProductModel);
//     _favouriteProductModel.add(favouriteProductModel);
//     // _totalPrice += (double.parse(favouriteProductModel.price!) *
//     //     favouriteProductModel.quantity!);
//
//     update();
//   }
//
//
// }

