
import 'package:ecommerce5_ui/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../controllers/cart_controller.dart';
import '../controllers/favouriteController.dart';
import '../models/cart_product_model.dart';
import '../models/product_model.dart';
import 'cart.dart';

class DetailsView extends StatelessWidget {
  final ProductModel? model;
  final itemIndex;

  DetailsView({this.model, this.itemIndex});
  final HomeController homeController = Get.put(HomeController());
  final FavouriteController favouriteController = Get.put(FavouriteController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // title: Text('Shopee'),
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Icon(Icons.favorite_border_outlined),
            ),
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
      body: Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * .98,
              height: 350,
              child: Image.network(
                model!.image!,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 15,
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(18),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          CustomText(
                            text: model!.name,
                            fontSize: 26,
                          ),


                          FlatButton(
                            onPressed: () {
                              // favouriteController
                              //     .addItem(homeController.favouriteModel![item]);
                              Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text('Added to wishlist'),
                              ));
                            },
                            child: Row(
                              children: [
                                Icon(Icons.favorite_border_outlined),
                              ],
                            ),
                          ),
                        ],
                      ),



                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: EdgeInsets.all(16),
                            width: MediaQuery.of(context).size.width * .4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.grey,
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomText(
                                  text: 'Size',
                                ),
                                CustomText(
                                  text: model!.sized,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(16),
                            width: MediaQuery.of(context).size.width * .44,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.grey,
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomText(
                                  text: 'Color',
                                ),
                                Container(
                                  width: 30,
                                  height: 20,
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(20),
                                    color: model!.color,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomText(
                        text: 'Details',
                        fontSize: 18,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomText(
                        text: model!.description,
                        fontSize: 18,
                        height: 2.5,
                      )
                    ],
                  ),
                ),
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.all(10),
            //child:
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      CustomText(
                        text: "PRICE ",
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: ' \$' + model!.price!,
                        color: primaryColor,
                        fontSize: 25,
                      )
                    ],
                  ),
                ),

                // FlatButton(
                //   onPressed: () {
                //     wishlistController
                //         .addItem(shoppingController.items[itemIndex]);
                //     Scaffold.of(context).showSnackBar(SnackBar(
                //       content: Text('Added to wishlist'),
                //     ));
                //   },
                //   child: Row(
                //     children: [
                //       Icon(Icons.favorite_border_outlined),
                //     ],
                //   ),
                // ),
                //
                //
                // FlatButton(
                //   onPressed: () {
                //     favouriteController
                //         .addItem(shoppingController.items[itemIndex]);
                //     Scaffold.of(context).showSnackBar(SnackBar(
                //       content: Text('Added to wishlist'),
                //     ));
                //   },
                //   child: Row(
                //     children: [
                //       Icon(Icons.favorite_border_outlined),
                //     ],
                //   ),
                // ),
                GetBuilder<CartController>(
                  //init: Get.find(),
                  init: Get.put(CartController()),
                  //init: CartController(),
                  builder: (controller) => Container(
                    padding: EdgeInsets.all(20),
                    width: 180,
                    height: 100,
                    child: CustomButton(
                      onPress: () {
                        controller.addProduct(
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
                      text: 'Add',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
