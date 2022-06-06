import 'package:ecommerce5_ui/controllers/CheckOutController.dart';
import 'package:ecommerce5_ui/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class Summary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<CartController>(
        builder: (controller) => Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              height: 350,
              color: Colors.red,
              padding: EdgeInsets.all(20),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 150,
                        height: 180,
                        child: Image.network(
                          controller.cartProductModel[index].image!,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      CustomText(
                        text: controller.cartProductModel[index].name,
                      ),
                      RichText(
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          style: TextStyle(color: Colors.black),
                          text: controller.cartProductModel[index].name,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        alignment: Alignment.bottomLeft,
                        color: primaryColor,
                        text:
                            controller.cartProductModel[index].price.toString(),
                      ),
                    ],
                  ),
                ),
                itemCount: controller.cartProductModel.length,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 15,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                text: 'Shipping Address',
                fontSize: 24,
              ),
            ),
            GetBuilder<CheckOutController>(
              builder: (controller) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomText(
                    fontSize: 24,
                    color: Colors.grey,
                    text:
                        '${controller.street1 + ',' + controller.street2 + ',' + controller.city + ',' + controller.state + ',' + controller.country}',
                  )),
            )
          ],
        ),
      ),
    );
  }
}
