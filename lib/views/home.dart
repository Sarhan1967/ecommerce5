import 'package:carousel_pro/carousel_pro.dart';
import 'package:ecommerce5_ui/controllers/cart_controller.dart';
import 'package:ecommerce5_ui/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../controllers/favouriteController.dart';
import '../models/product_model.dart';
import 'cart.dart';
import 'details.dart';
import 'favourite.dart';


class HomeView extends StatelessWidget {
  late final ProductModel? model;

   final isFavorite = false;
  final HomeController homeController = Get.put(HomeController());
  final FavouriteController favouriteController = Get.put(FavouriteController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: Get.put(HomeController()),
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              drawer: _drawer(),
              appBar: AppBar(
                title: Text('Shopee'),
                backgroundColor: kPrimaryColor,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {},
                  ),
                  InkWell(
                    onTap: () {

                      //Get.to(() => FavouriteView());
                    },
                    child: Stack(
                      children: [
                        GetBuilder<FavouriteController>(
                          init: Get.put(FavouriteController()),
                          builder: (controller) => Align(
                            child: Text(
                                controller.favouriteModel.length > 0
                                    ? controller.favouriteModel.length
                                        .toString()
                                    : '0'),
                            alignment: Alignment.topLeft,
                          ),
                        ),
                        Align(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Icon(Icons.favorite_border_outlined),
                            //alignment: Alignment.center,
                          ),
                        ),
                      ],
                    ),
                    // child: Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 20),
                    //   child: Icon(Icons.favorite_border_outlined),
                    // ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => CartView());
                    },
                    child: Stack(
                      children: [
                        GetBuilder<CartController>(
                          init: Get.put(CartController()),
                          builder: (controller) => Align(
                            child: Text(controller.cartProductModel.length > 0
                                ? controller.cartProductModel.length.toString()
                                : ''),
                            alignment: Alignment.topLeft,
                          ),
                        ),
                        Align(
                          child: Icon(Icons.shopping_cart),
                          alignment: Alignment.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      _carousel(),
                      //_searchTextFormField(),
                      SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "Categories",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      _listViewCategory(),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Best Selling",
                            fontSize: 18,
                          ),
                          CustomText(
                            text: "See all",
                            fontSize: 16,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      _listViewProducts(),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget _carousel() {
    return Container(
      height: 130,
      color: Colors.white,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: const [
          AssetImage('assets/images/img1.jpg'),
          AssetImage('assets/images/img2.jpg'),
          AssetImage('assets/images/img3.jpg'),
          AssetImage('assets/images/img4.jpg'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 5,
        dotColor: Colors.white,
        dotBgColor: Colors.transparent,
      ),
    );
  }

  Widget _drawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            //height: MediaQuery.of(context).size.height / 9.3,
            height: getWRatio(80),
            child: InkWell(
              onTap: () {
                Get.offAll(() => HomeView());
              },
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    SizedBox(width: 20),
                    Text(
                      'My Home',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Get.back();
              //Get.to(() => ProfileView());
            },
            leading: Icon(Icons.person, color: kPrimaryColor),
            title: Text("My Account"),
          ),
          ListTile(
            onTap: () {
              Get.back();
              //Get.to(() => FavouriteView());
            },
            leading: Icon(Icons.favorite_border, color: kPrimaryColor),
            title: Text("My Favourite"),
          ),
          ListTile(
            leading: Icon(Icons.drive_file_move_outline, color: kPrimaryColor),
            title: Text("My Orders"),
          ),
          ListTile(
            onTap: () {
              Get.back();
              Get.to(() => CartView());
            },
            leading: Icon(Icons.shopping_cart_outlined, color: kPrimaryColor),
            title: Text("My Cart"),
          ),
          Divider(),
          ListTile(
            title: Text('Settings'),
            leading: Icon(
              Icons.settings,
              color: Colors.blue,
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text('About'),
            leading: Icon(
              Icons.help,
              color: Colors.blue,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _searchTextFormField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getWRatio(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: SizeConfig.screenWidth * 0.7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.shade200,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search product",
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          IconBtnWithCounter(
            svgSrc: "assets/menu_icon/Bell.svg",
            numOfitem: 3,
            //numOfitem: controller.categoryModel.length,
            press: () {},
          ),
        ],
      ),
    );
  }

  Widget _listViewCategory() {
    return GetBuilder<HomeController>(
      builder: (controller) => Container(
        height: 100,
        child: ListView.separated(
          itemCount: controller.categoryModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey.shade100,
                  ),
                  height: 72,
                  width: 72,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child:
                        Image.network(controller.categoryModel[index].image!),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                CustomText(
                  text: controller.categoryModel[index].name,
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            width: 3,
          ),
        ),
      ),
    );
  }

  Widget _listViewProducts() {
    return GetBuilder<HomeController>(
      builder: (controller) => Container(
        height: 250,
        child: ListView.separated(
          itemCount: controller.productModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              //borderRadius: BorderRadius.circular(10),
              children: [
                // child: GridTile(
                GestureDetector(
                  onTap: () {
                    Get.to(
                      () => DetailsView(
                        model: controller.productModel[index],

                            // () => DetailsView(
                            //     model:controller.favouriteItems[ProductModel],

                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: Container(
                      height: 140,
                      width: MediaQuery.of(context).size.width * .45,
                      child: Image.network(
                        controller.productModel[index].image!,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
//                       /*
//                       // GetBuilder<FavouriteController>(
//                       //   init: Get.put(FavouriteController()),
//                       //   builder: (controller) => IconButton(
//                       //     icon: Icon(
//                       //       controller.favouriteProductModel[index]
//                       //           .isFavourite ==
//                       //           true
//                       //           ? Icons.favorite
//                       //           :Icons.favorite_border,
//                       //       color: Theme.of(context).colorScheme.secondary,
//                       //     ),
//                       //     onPressed: () {
//                       //       //controller.toggleFavouriteStatus(index);
//                       //     },
//                       //   ),
//                       // ),
// */

///*

                      Obx(() =>
                         IconButton(
                          icon: Icon(
                            controller.productModel[index].isFavourite ==
                                    true
                                ? Icons.favorite

                                : Icons.favorite_border,
                            color: kPrimaryColor,
                          ),
                          onPressed: () {
                            controller.toggleFavouriteStatus(index);
                            favouriteController
                                .addItem(homeController.items[index]);
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text('Added to wishlist'),
                            ));
                          },
                        ),
                      ),
  //*/
//
// //*
//                       GetBuilder<FavouriteController>(
//                         init: Get.put(FavouriteController()),
//                         //init: CartController(),
//                         builder: (controller) => IconButton(
//                           icon: Icon(
//                             //controller.favouriteProductModel[index].isFavourite ==
//                             controller.favouriteProductModel[index]
//                                         .isFavourite ==
//                                     true
//                                 ? Icons.favorite
//                                 : Icons.favorite_border,
//                             color: kPrimaryColor,
//                           ),
//                           onPressed: () {
//                             controller.toggleFavouriteStatus(index);
//
//                             controller.addProduct(
//                               FavouriteProductModel(
//                                 //ProductModel model;
//                                 name: model!.name,
//                                 image: model!.image,
//                                 price: model!.price,
//                                 isFavourite: model!.isFavourite,
//                                 productId: model!.productId,
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//
                      Text(
                        controller.productModel[index].name!,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            width: 20,
          ),
        ),
      ),
    );
  }
}

/*
  Widget _listViewProducts() {
    return ListView.separated(
      itemCount: controller.productModel.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return GetBuilder<HomeController>(
          builder: (controller) => ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GridTile(
              child: GestureDetector(
                onTap: () {
                  Get.to(
                    () => DetailsView(
                      model: controller.productModel[index],
                    ),
                  );
                },
                child: Image.network(
                  controller.productModel[index].image!,
                  fit: BoxFit.fill,
                ),
              ),
              // footer: GridTileBar(
              //   backgroundColor: Colors.black87,
              //   leading: GetBuilder<FavouriteController>(
              //     init: Get.put(FavouriteController()),
              //     builder: (controller) => IconButton(
              //       icon: Icon(
              //         controller.favouriteProductModel[index].isFavourite ==
              //                 true
              //             ? Icons.favorite
              //             : Icons.favorite_border,
              //         color: Theme.of(context).colorScheme.secondary,
              //       ),
              //       onPressed: () {
              //         controller.toggleFavouriteStatus(index);
              //       },
              //     ),
              //   ),
              //   title: Text(
              //     controller.productModel[index].name!,
              //     textAlign: TextAlign.center,
              //   ),
              // ),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => SizedBox(
        width: 10,
      ),
    );
  }
 */

// Widget _listViewProducts() {
//   return GetBuilder<HomeController>(
//     builder: (controller) =>
//         Container(
//           width: SizeConfig.screenWidth * 0.98,
//           height: 250,
//
//           child: Column(
//               children: [
//                 ListView.separated(
//                   itemCount: controller.productModel.length,
//                   scrollDirection: Axis.horizontal,
//                   itemBuilder: (context, index) {
//                     // return ClipRRect(
//                     //   borderRadius: BorderRadius.circular(20),
//                     //   child: GridTile(
//                         child: GestureDetector(
//                           onTap: () {
//                             Get.to(() =>
//                                 DetailsView(
//                                   model: controller.productModel[index],
//                                 ),);
//                           },
//
//                            child: Container(
//                              height: 140,
//                              width: SizeConfig.screenWidth * 0.45,
//                             child: Image.network(
//                               controller.productModel[index].image!,
//                               fit: BoxFit.fill,
//                             ),
//                           ),
//                         ),
//
//                         // footer: GridTileBar(
//                         //   backgroundColor: Colors.black87,
//                         //   leading: GetBuilder<FavouriteController>(
//                         //     init: Get.put(FavouriteController()),
//                         //     builder: (controller) =>
//                         //         IconButton(
//                         //           icon: Icon(
//                         //             controller.favouriteProductModel[index]
//                         //                 .isFavourite == true
//                         //                 ? Icons.favorite
//                         //                 : Icons.favorite_border,
//                         //             color: Theme
//                         //                 .of(context)
//                         //                 .colorScheme
//                         //                 .secondary,
//                         //           ),
//                         //           onPressed: () {
//                         //             controller.toggleFavouriteStatus(index);
//                         //           },
//                         //         ),
//                         //   ),
//                         //   title: Text(
//                         //     controller.productModel[index].name!,
//                         //     textAlign: TextAlign.center,
//                         //   ),
//                         // ),
//                       , separatorBuilder: (BuildContext context, int index) {  },),
//                     );
//                   },
//                   separatorBuilder: (BuildContext context, int index) =>
//                       SizedBox(
//                         width: 10,
//                       ),
//                 ),
//               ],
//           ),
//         ),
//   );
// }

//       child: ListView.separated(
//         itemCount: controller.productModel.length,
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) {
//           return ClipRRect(
//             borderRadius: BorderRadius.circular(10),
//             child: GridTile(
//               child: GestureDetector(
//                 onTap: () {
//                   Get.to(() =>
//                       DetailsView(
//                         model: controller.productModel[index],
//                       ),);
//                 },
//
//                 child: Image.network(
//                   controller.productModel[index].image!,
//                   fit: BoxFit.fill,
//                 ),
//               ),
//
//               // footer: GridTileBar(
//               //   backgroundColor: Colors.black87,
//               //   leading: GetBuilder<FavouriteController>(
//               //     init: Get.put(FavouriteController()),
//               //     builder: (controller) =>
//               //         IconButton(
//               //           icon: Icon(
//               //             controller.favouriteProductModel[index]
//               //                 .isFavourite == true
//               //                 ? Icons.favorite
//               //                 : Icons.favorite_border,
//               //             color: Theme
//               //                 .of(context)
//               //                 .colorScheme
//               //                 .secondary,
//               //           ),
//               //           onPressed: () {
//               //             controller.toggleFavouriteStatus(index);
//               //           },
//               //         ),
//               //   ),
//               //   title: Text(
//               //     controller.productModel[index].name!,
//               //     textAlign: TextAlign.center,
//               //   ),
//               // ),
//             ),
//           );
//         },
//
//         separatorBuilder:
//             (BuildContext context, int index) =>
//             SizedBox(width: 10,
//             ),
//       ),
//     ),);
// }

/*
Widget _listViewProducts() {
  return GetBuilder<HomeController>(
    builder: (controller) => Container(
      height: 250,
      child: ListView.separated(
        itemCount: controller.productModel.length,
        //itemCount: names.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.to(
                () => DetailsView(
                  model: controller.productModel[index],
                ),
              );
            },
            //   child: Container(
            //     width: SizeConfig.screenWidth * 0.45,
            //     //width: MediaQuery.of(context).size.width * .4,
            //     /*
            //   child: Column(
            //     children: [
            //       Container(
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(50),
            //           color: Colors.grey.shade100,
            //         ),
            //         child: Container(
            //           height: 140,
            //           width: SizeConfig.screenWidth * 0.45,
            //           child: Image.network(
            //             controller.productModel[index].image!,
            //             fit: BoxFit.fill,
            //           ),
            //         ),
            //       ),
            //       SizedBox(
            //         height: 10,
            //       ),
            //       CustomText(
            //         text: controller.productModel[index].name,
            //         //text: "bestPlay Speaker",
            //         alignment: Alignment.center,
            //       ),
            //       SizedBox(
            //         height: 8,
            //       ),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Text(
            //             " Price: " +
            //                 " \$" +
            //                 " " +
            //                 controller.productModel[index].price.toString(),
            //             style: TextStyle(
            //               fontSize: getWRatio(18),
            //               fontWeight: FontWeight.w600,
            //               color: kPrimaryColor,
            //             ),
            //           ),
            //           GetBuilder<FavouriteController>(
            //             //init: Get.find(),
            //             init: Get.put(FavouriteController()),
            //             //init: CartController(),
            //             builder: (controller) => Container(
            //               padding: EdgeInsets.all(10),
            //               width: 40,
            //               height: 20,
            //               // child: ListTile(
            //               //   onTap: () {
            //               //     //Get.back();
            //               //     Get.to(() => FavouriteView());
            //               //   },
            //               //   leading: Icon(Icons.favorite_border, color: kPrimaryColor),
            //               //   title: Text("My Favourite"),
            //               // ),
            //
            //               child: FavoriteButton(
            //                   isFavorite: true,
            //                   // iconDisabledColor: Colors.white,
            //                   valueChanged: (_isFavorite) {
            //                     print('Is Favorite : $_isFavorite');
            //                     controller.addProduct(
            //                       FavouriteProductModel(
            //                         //ProductModel model;
            //                         name: model!.name,
            //                         image: model!.image,
            //                         price: model!.price,
            //                         quantity: 1,
            //                         productId: model!.productId,
            //                       ),
            //                     );
            //                     //Get.off(() => FavouriteView());
            //                   }),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            //
            //   */
            //     //      child: Padding(
            //     //     padding: EdgeInsets.all(5.0),
            //     // child: InkResponse(
            //     //     onTap: () {
            //     //       Navigator.push(
            //     //           context,
            //     //           MaterialPageRoute(
            //     //               builder: (context) => ItemDetailPage(itemId: item.id)));
            //     //     },
            //     child: Material(
            //       child: Container(
            //         height: 140.0,
            //         padding: EdgeInsets.all(5.0),
            //         decoration: BoxDecoration(
            //             color: Colors.white,
            //             shape: BoxShape.rectangle,
            //             boxShadow: [
            //               BoxShadow(color: Colors.black12, blurRadius: 8.0)
            //             ]),
            //         child: Column(
            //             children: [
            //             Container(
            //                   decoration: BoxDecoration(
            //                   borderRadius: BorderRadius.circular(50),
            //                   color: Colors.grey.shade100,
            //                 ),
            //                child: Container(
            //                     height: 140,
            //                     width: SizeConfig.screenWidth * 0.45,
            //                     child: Image.network(
            //                       controller.productModel[index].image!,
            //                       fit: BoxFit.fill,
            //                       ),
            //                     ),
            //                   ),
            //                   SizedBox(
            //                     height: 10,
            //                   ),
            //                   CustomText(
            //                     text: controller.productModel[index].name,
            //                     //text: "bestPlay Speaker",
            //                     alignment: Alignment.center,
            //                   ),
            //                   SizedBox(
            //                     height: 8,
            //                   ),
            //                   Row(
            //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                         children: [
            //                           Text(" Price: " +" \$" +" " +
            //
            //                                 controller.productModel[index].price.toString(),
            //                             style: TextStyle(
            //                               fontSize: getWRatio(18),
            //                               fontWeight: FontWeight.w600,
            //                               color: kPrimaryColor,
            //                             ),
            //                           ),
            //
            //                     controller.productModel[index].isFavourite
            //                         ? Icon(
            //                       Icons.favorite,
            //                       size: 20.0,
            //                       color: Colors.red,
            //                     )
            //                         : Icon(
            //                       Icons.favorite_border,
            //                       size: 20.0,
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // ),
            // )
            // )
            // ,
            // );

            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey.shade100,
                  ),
                  child: Container(
                    height: 140,
                    width: SizeConfig.screenWidth * 0.45,
                    child: Image.network(
                      controller.productModel[index].image!,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: controller.productModel[index].name,
                  //text: "bestPlay Speaker",
                  alignment: Alignment.center,
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      " Price: " +
                          " \$" +
                          " " +
                          controller.productModel[index].price.toString(),
                      style: TextStyle(
                        fontSize: getWRatio(18),
                        fontWeight: FontWeight.w600,
                        color: kPrimaryColor,
                      ),
                    ),
                    // Container(
                    //   child: controller.productModel[index].isFavourite
                    //       ? Icon(
                    //           Icons.favorite,
                    //           size: 20.0,
                    //           color: Colors.red,
                    //         )
                    //       : Icon(
                    //           Icons.favorite_border,
                    //           size: 20.0,
                    //         ),
                    //
                    //   // GetBuilder<FavouriteController>(
                    //   //   //init: Get.find(),
                    //   //   init: Get.put(FavouriteController()),
                    //   //   //init: CartController(),
                    //   //   builder: (controller) => Container(
                    //   //     padding: EdgeInsets.all(10),
                    //   //     width: 40,
                    //   //     height: 20,
                    //   //     // child: ListTile(
                    //   //     //   onTap: () {
                    //   //     //     //Get.back();
                    //   //     //     Get.to(() => FavouriteView());
                    //   //     //   },
                    //   //     //   leading: Icon(Icons.favorite_border, color: kPrimaryColor),
                    //   //     //   title: Text("My Favourite"),
                    //   //     // ),
                    //   //
                    //   //     child: FavoriteButton(
                    //   //         isFavorite: true,
                    //   //         // iconDisabledColor: Colors.white,
                    //   //         valueChanged: (_isFavorite) {
                    //   //           print('Is Favorite : $_isFavorite');
                    //   //           controller.addProduct(
                    //   //             FavouriteProductModel(
                    //   //               //ProductModel model;
                    //   //               name: model!.name,
                    //   //               image: model!.image,
                    //   //               price: model!.price,
                    //   //               quantity: 1,
                    //   //               productId: model!.productId,
                    //   //             ),
                    //   //           );
                    //   //           //Get.off(() => FavouriteView());
                    //   //         }),
                    //   //   ),
                    //   // ),
                    // ),
                  ],
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => SizedBox(
          width: 10,
        ),
      ),
    ),
  );
}
   */
