import 'package:ecommerce5_ui/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../constants.dart';
import 'checkOut/add_address.dart';
import 'checkOut/checkOutView.dart';
import 'home.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      //init: CartController(),
      init: Get.put(CartController()),
      //init: Get.find(),
      builder: (controller) => Scaffold(
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
            ),
          ),
          actions: <Widget>[
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
                          : '0'),
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
        body: controller.cartProductModel.length == 0
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
                    text: 'The Cart is Empty',
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
                                  height: 170,
                                  width: 200,
                                  //child: Image.asset(images[index], fit: BoxFit.fill),
                                  child: Image.network(
                                    controller.cartProductModel[index].image!,
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
                                            .cartProductModel[index].name,
                                        fontSize: 30,
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      CustomText(
                                        color: primaryColor,
                                        text:
                                            '\$ ${controller.cartProductModel[index].price.toString()}',
                                        fontSize: 30,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width: 140,
                                        height: 40,
                                        color: Colors.grey.shade200,
                                        padding: EdgeInsets.only(top: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                                child: Icon(
                                                  Icons.add,
                                                  color: Colors.black,
                                                  size: 40,
                                                ),
                                                onTap: () {
                                                  controller
                                                      //.cartItems(index);
                                                      .increaseQuantity(index);
                                                }),
                                            CustomText(
                                              alignment: Alignment.center,
                                              text: controller
                                                  .cartProductModel[index]
                                                  .quantity
                                                  .toString(),
                                              fontSize: 35,
                                            ),
                                            GestureDetector(
                                                child: Icon(
                                                  Icons.remove,
                                                  color: Colors.black,
                                                  size: 40,
                                                ),
                                                onTap: () {
                                                  controller
                                                      //.cartItems(index);
                                                      .decreaseQuantity(index);
                                                }),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: controller.cartProductModel.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 10,
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            CustomText(
                              text: 'TOTAL',
                              fontSize: 30,
                              color: Colors.blueAccent,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            GetBuilder<CartController>(
                              init: Get.find(),
                              builder: (controller) => CustomText(
                                text: '\$ ${controller.totalPrice}',
                                fontSize: 30,
                                color: primaryColor,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          height: 100,
                          width: 180,
                          child: CustomButton(
                            onPress: () {
                              Get.to(() => CheckOutView());
                            },
                            text: 'CHECKOUT',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
