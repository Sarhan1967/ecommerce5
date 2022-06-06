// import 'package:ecommerce5_ui/controllers/cartcontroller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
//
// import '../constants.dart';
// import '../controllers/checkout_viewmodel.dart';
//
// class CheckoutView extends StatelessWidget {
//   final _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             height: 130.h,
//             child: Padding(
//               padding: EdgeInsets.only(bottom: 24.h, left: 16.w, right: 16.w),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   IconButton(
//                     padding: EdgeInsets.zero,
//                     constraints: BoxConstraints(),
//                     onPressed: () {
//                       Get.back();
//                     },
//                     icon: Icon(
//                       Icons.arrow_back_ios,
//                       color: Colors.black,
//                     ),
//                   ),
//                   CustomText(
//                     text: 'Checkout',
//                     fontSize: 20,
//                     alignment: Alignment.bottomCenter,
//                   ),
//                   Container(
//                     width: 24,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: EdgeInsets.only(right: 16.w, left: 16.w, bottom: 24.h),
//                 child: Form(
//                   //key: _formKey,
//                   child: GetBuilder<CheckOutController>(
//                     //init: Get.find<CheckOutController>(),
//                     init: Get.find(),
//                     builder: (controller) => Column(
//                       key: _formKey,
//                       children: [
//                         //_listViewProducts(),
//                         //ListViewProducts(),
//                         SizedBox(
//                           height: 20.h,
//                         ),
//                         CustomTextFormField(
//                           text: 'Street',
//                           hint: '21, Tahrir Street',
//                           validator: (value) {
//                             if (value!.isEmpty || value.length < 4)
//                               return 'Please enter valid street name.';
//                           },
//                           onSave: (value) {
//                             controller.street = value;
//                           },
//                         ),
//                         SizedBox(
//                           height: 20.h,
//                         ),
//                         CustomTextFormField(
//                           text: 'City',
//                           hint: 'Downtown Cairo',
//                           validator: (value) {
//                             if (value!.isEmpty || value.length < 4)
//                               return 'Please enter valid city name.';
//                           },
//                           onSave: (value) {
//                             controller.city = value;
//                           },
//                         ),
//                         SizedBox(
//                           height: 20.h,
//                         ),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: CustomTextFormField(
//                                 text: 'State',
//                                 hint: 'Cairo',
//                                 validator: (value) {
//                                   if (value!.isEmpty || value.length < 4)
//                                     return 'Please enter valid state name.';
//                                 },
//                                 onSave: (value) {
//                                   controller.state = value;
//                                 },
//                               ),
//                             ),
//                             SizedBox(
//                               width: 36.w,
//                             ),
//                             Expanded(
//                               child: CustomTextFormField(
//                                 text: 'Country',
//                                 hint: 'Egypt',
//                                 validator: (value) {
//                                   if (value!.isEmpty || value.length < 4)
//                                     return 'Please enter valid city name.';
//                                 },
//                                 onSave: (value) {
//                                   controller.country = value;
//                                 },
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 20.h,
//                         ),
//                         CustomTextFormField(
//                           text: 'Phone Number',
//                           hint: '+20123456789',
//                           keyboardType: TextInputType.phone,
//                           validator: (value) {
//                             if (value!.isEmpty || value.length < 10)
//                               return 'Please enter valid number.';
//                           },
//                           onSave: (value) {
//                             controller.phone = value;
//                           },
//                         ),
//                         SizedBox(
//                           height: 38.h,
//                         ),
//                         CustomButton(
//                           text: 'SUBMIT',
//                           onPress:() async {
//                             if (_formKey.currentState!.validate()) {
//                               _formKey.currentState!.save();
//                               await controller.addCheckoutToFireStore();
//                               Get.dialog(
//                                 AlertDialog(
//                                   content: SingleChildScrollView(
//                                     child: Column(
//                                       mainAxisSize: MainAxisSize.min,
//                                       children: [
//                                         Icon(
//                                           Icons.check_circle_outline_outlined,
//                                           color: primaryColor,
//                                           size: 200.h,
//                                         ),
//                                         CustomText(
//                                           text: 'Order Submitted',
//                                           fontSize: 24,
//                                           fontWeight: FontWeight.bold,
//                                           color: primaryColor,
//                                           alignment: Alignment.center,
//                                         ),
//                                         SizedBox(
//                                           height: 40.h,
//                                         ),
//                                         CustomButton(
//                                           text: 'Done',
//                                           onPress: (){Get.back();},
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 barrierDismissible: false,
//                               );
//                             }
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//
// //   Widget _listViewProducts() {
// //     return GetBuilder<HomeController>(
// //       builder: (controller) => Container(
// //         height: 250,
// //         child: ListView.separated(
// //           itemCount: controller.productModel.length,
// //           scrollDirection: Axis.horizontal,
// //           itemBuilder: (context, index) {
// //             return Column(
// //               //borderRadius: BorderRadius.circular(10),
// //               children: [
// //                 // child: GridTile(
// //                 GestureDetector(
// //                   onTap: () {
// //                     Get.to(
// //                           () => DetailsView(
// //                         model: controller.productModel[index],
// //
// //                         // () => DetailsView(
// //                         //     model:controller.favouriteItems[ProductModel],
// //
// //                       ),
// //                     );
// //                   },
// //                   child: ClipRRect(
// //                     borderRadius: const BorderRadius.all(Radius.circular(20)),
// //                     child: Container(
// //                       height: 140,
// //                       width: MediaQuery.of(context).size.width * .45,
// //                       child: Image.network(
// //                         controller.productModel[index].image!,
// //                         fit: BoxFit.fill,
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //                 SizedBox(
// //                   height: 10,
// //                 ),
// //                 Container(
// //                   height: 60,
// //                   width: MediaQuery.of(context).size.width * 0.45,
// //                   child: Row(
// //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     children: [
// // //                       /*
// // //                       // GetBuilder<FavouriteController>(
// // //                       //   init: Get.put(FavouriteController()),
// // //                       //   builder: (controller) => IconButton(
// // //                       //     icon: Icon(
// // //                       //       controller.favouriteProductModel[index]
// // //                       //           .isFavourite ==
// // //                       //           true
// // //                       //           ? Icons.favorite
// // //                       //           :Icons.favorite_border,
// // //                       //       color: Theme.of(context).colorScheme.secondary,
// // //                       //     ),
// // //                       //     onPressed: () {
// // //                       //       //controller.toggleFavouriteStatus(index);
// // //                       //     },
// // //                       //   ),
// // //                       // ),
// // // */
// //
// //                       ///*
// //
// //                       IconButton(
// //                         icon: Icon(
// //                           controller.productModel[index].isFavourite ==
// //                               true
// //                               ? Icons.favorite
// //                               : Icons.favorite_border,
// //                           color: kPrimaryColor,
// //                         ),
// //                         onPressed: () {
// //                           controller.toggleFavouriteStatus(index);
// //                         },
// //                       ),
// //                       //*/
// // //
// // // //*
// // //                       GetBuilder<FavouriteController>(
// // //                         init: Get.put(FavouriteController()),
// // //                         //init: CartController(),
// // //                         builder: (controller) => IconButton(
// // //                           icon: Icon(
// // //                             //controller.favouriteProductModel[index].isFavourite ==
// // //                             controller.favouriteProductModel[index]
// // //                                         .isFavourite ==
// // //                                     true
// // //                                 ? Icons.favorite
// // //                                 : Icons.favorite_border,
// // //                             color: kPrimaryColor,
// // //                           ),
// // //                           onPressed: () {
// // //                             controller.toggleFavouriteStatus(index);
// // //
// // //                             controller.addProduct(
// // //                               FavouriteProductModel(
// // //                                 //ProductModel model;
// // //                                 name: model!.name,
// // //                                 image: model!.image,
// // //                                 price: model!.price,
// // //                                 isFavourite: model!.isFavourite,
// // //                                 productId: model!.productId,
// // //                               ),
// // //                             );
// // //                           },
// // //                         ),
// // //                       ),
// // //
// //                       Text(
// //                         controller.productModel[index].name!,
// //                         textAlign: TextAlign.start,
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             );
// //           },
// //           separatorBuilder: (context, index) => SizedBox(
// //             width: 20,
// //           ),
// //         ),
// //       ),
// //     );
// //   }
//
// }
//
// // class ListViewProducts extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return GetBuilder<CartController>(
// //       builder: (controller) => Column(
// //         children: [
// //           Container(
// //             height: 160.h,
// //             child: ListView.separated(
// //               scrollDirection: Axis.horizontal,
// //               itemCount: controller.cartProducts.length,
// //               itemBuilder: (context, index) {
// //                 return Container(
// //                   width: 120.w,
// //                   child: Column(
// //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Container(
// //                         decoration: BoxDecoration(
// //                           borderRadius: BorderRadius.circular(4.r),
// //                           color: Colors.white,
// //                         ),
// //                         height: 120.h,
// //                         width: 120.w,
// //                         child: Image.network(
// //                           (controller.cartProducts[index].image).toString(),
// //                           fit: BoxFit.cover,
// //                         ),
// //                       ),
// //                       CustomText(
// //                         text: controller.cartProducts[index].name,
// //                         fontSize: 14,
// //                         maxLine: 1,
// //                       ),
// //                       CustomText(
// //                         text:
// //                             '\$${controller.cartProducts[index].price} x ${controller.cartProducts[index].quantity}',
// //                         fontSize: 14,
// //                         color: primaryColor,
// //                       ),
// //                     ],
// //                   ),
// //                 );
// //               },
// //               separatorBuilder: (context, index) {
// //                 return SizedBox(
// //                   width: 15.w,
// //                 );
// //               },
// //             ),
// //           ),
// //           SizedBox(
// //             height: 12.h,
// //           ),
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             crossAxisAlignment: CrossAxisAlignment.center,
// //             children: [
// //               CustomText(
// //                 text: 'TOTAL: ',
// //                 fontSize: 14,
// //                 color: Colors.grey,
// //               ),
// //               CustomText(
// //                 text: '\$${controller.totalPrice.toString()}',
// //                 fontSize: 16,
// //                 fontWeight: FontWeight.bold,
// //                 color: primaryColor,
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
