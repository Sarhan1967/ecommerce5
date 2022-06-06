import 'package:ecommerce5_ui/controllers/favouriteController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../controllers/cart_controller.dart';
import '../models/cart_product_model.dart';
import '../models/product_model.dart';
import 'home.dart';

class FavouriteView extends StatelessWidget {
  final FavouriteController favouriteController =
      Get.put(FavouriteController());

  final CartController cartController = Get.put(CartController());

  final ProductModel? model;

  FavouriteView({Key? key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Wishlist'),
      ),
      body: Obx(
        () => favouriteController.itemCount != 0
            ? GetX<FavouriteController>(
                builder: (controller) {
                  return Container(
                    padding: EdgeInsets.all(5),
                    child: ListView.builder(
                      itemCount: favouriteController.itemCount,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    controller
                                        .favouriteModel[index].image!,
                                  ),
                                ),
                                Divider(),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 100,
                                      padding: EdgeInsets.all(5),
                                      child: Image.network(
                                        controller.favouriteModel[index]
                                            .image!,
                                        fit: BoxFit.fill,
                                        //fit: BoxFit.cover,
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text(
                                                  '${controller.favouriteModel[index].description}'),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text('Qunatity : 1'),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text(
                                                '${controller.favouriteModel[index].price}',
                                                style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    FlatButton(
                                      onPressed: () {
                                        // cartController.addItem(
                                        //     favouriteController
                                        //         .favouriteProductModel[index]);

                                        cartController.addProduct(
                                          CartProductModel(
                                            //ProductModel model;
                                            name: model!.name,
                                            image: model!.image,
                                            price: model!.price,
                                            quantity: 1,
                                            productId: model!.productId,
                                          ),
                                        );
                                      },
                                      child: Row(
                                        children: [
                                          Text('Add to Cart'),
                                          Icon(Icons.shopping_cart_outlined),
                                        ],
                                      ),
                                    ),
                                    FlatButton(
                                      onPressed: () {
                                        favouriteController.remove(controller
                                            .favouriteModel[index]);
                                      },
                                      child: Row(
                                        children: [
                                          Text('Remove'),
                                          Icon(Icons.delete),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Your Wishlist is Empty'),
                    FlatButton(
                      onPressed: () {
                        //Get.offAll(HomePage());
                        Get.offAll(HomeView());
                      },
                      child: Text(
                        'Add Now',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: kPrimaryColor,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

//class FavouriteView extends StatelessWidget-----------
/*
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../controllers/favouriteController.dart';
import 'home.dart';

class FavouriteView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavouriteController>(
      //init: CartController(),
      init: Get.put(FavouriteController()),
      //init: Get.find(),
      builder: (controller) =>Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          leading: GestureDetector(
              onTap: () {
                Get.off(HomeView());
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
        ),
        body: controller.favouriteProductModel.length == 0
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                  SvgPicture.asset(
                    'assets/images/empty_cart.svg',
                    width: 200,
                    height: 200,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    text: 'Please add your \nfavourite Items',
              fontSize: 32,
              alignment: Alignment.topCenter,
            ),
          ],
        )
            : Column(
          children: [
            Expanded(
              child: Container(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      child: Row(
                        children: [
                          Container(
                            height: 150,
                            width: 150,
                            //child: Image.asset(images[index], fit: BoxFit.fill),
                            child: Image.network(
                              controller.favouriteProductModel[index].image!,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: controller
                                      .favouriteProductModel[index].name,
                                  fontSize: 30,
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                CustomText(
                                  color: primaryColor,
                                  text:
                                  '\$ ${controller.favouriteProductModel[index].price.toString()}',
                                  fontSize: 30,
                                ),
                                // SizedBox(
                                //   height: 10,
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: controller.favouriteProductModel.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 10,
                    );
                  },
                ),
              ),
            ),
            // SizedBox(height: 20,),
            // Padding(
            //   padding: const EdgeInsets.all(20),
              // child: Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Column(
              //       children: [
              //         CustomText(
              //           text: 'TOTAL',
              //           fontSize: 30,
              //           color: Colors.blueAccent,
              //         ),
              //         SizedBox(
              //           height: 10,
              //         ),
              //         GetBuilder<CartController>(
              //           init: Get.find(),
              //           builder: (controller) => CustomText(
              //             text: '\$ ${controller.totalPrice}',
              //             fontSize: 30,
              //             color: primaryColor,
              //           ),
              //         ),
              //       ],
              //     ),
              //     Container(
              //       padding: EdgeInsets.all(20),
              //       height: 100,
              //       width: 180,
              //       child: CustomButton(
              //         onPress: () {
              //           Get.to(()=>CheckOutView());
              //         },
              //         text: 'CHECKOUT',
              //       ),
              //     ),
              //   ],
              // ),

            //),
          ],
        ),
      ),
    );
  }
}
 */
