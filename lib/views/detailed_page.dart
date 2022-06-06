// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/favouriteController.dart';
// import '../controllers/home_controller.dart';
// import '../item_details.dart';
// import '../models/product_model.dart';
//
// // class Detailedpage extends StatelessWidget {
// //   static const String id = 'detailed_page';
// //   final int itemIndex;
// //   Detailedpage({required this.itemIndex});
//
//
//   class Detailedpage extends StatelessWidget {
//   final ProductModel? model;
//   final int itemIndex;
//
//   Detailedpage({this.model,required this.itemIndex});
//   // final ShoppingController shoppingController = Get.put(ShoppingController());
//   // final WishlistController wishlistController = Get.put(WishlistController());
//
//   final FavouriteController favouriteController =
//   Get.put(FavouriteController());
//   final HomeController homeController = Get.put(HomeController());
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Builder(builder: (BuildContext context) {
//       return SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.all(10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 height: 80,
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     FlatButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       child: Row(
//                         children: [
//                           Icon(Icons.arrow_back),
//                           Text('Back'),
//                         ],
//                       ),
//                     ),
//                     FlatButton(
//                       onPressed: () {
//                         favouriteController
//                             .addItem(homeController.favouriteItems[itemIndex]);
//                         Scaffold.of(context).showSnackBar(SnackBar(
//                           content: Text('Added to wishlist'),
//                         ));
//                       },
//                       child: Row(
//                         children: [
//                           Icon(Icons.favorite_border_outlined),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//                ItemDetails(itemIndex: itemIndex),
//               // ProductRating(),
//               // DiscountCardWidget(),
//               // RateProduct(),
//               // DetailedDescription(itemIndex: itemIndex),
//               // ReviewWidget(),
//               // BottomBottons(itemIndex: itemIndex),
//             ],
//           ),
//         ),
//       );
//     }));
//   }
// }
