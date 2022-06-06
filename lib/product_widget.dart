// import 'package:ecommerce5_ui/views/detailed_page.dart';
// import 'package:ecommerce5_ui/views/details.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import 'constants.dart';
//
// class ProductWidget extends StatelessWidget {
//   final String image;
//   final String name;
//   final String desc;
//   final String price;
//   final bool marginLeft;
//   final borderColor;
//   final int productIndex;
//   ProductWidget({
//     required this.desc,
//     required this.image,
//     required this.name,
//     required this.price,
//     required this.marginLeft,
//     this.borderColor,
//     required this.productIndex,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Get.to(DetailsView(
//           itemIndex: productIndex,
//         ));
//       },
//       child: Container(
//         margin:
//             marginLeft ? EdgeInsets.only(left: 8) : EdgeInsets.only(right: 8),
//         height: 100,
//         padding: EdgeInsets.all(8),
//         decoration: BoxDecoration(border: Border.all(color: borderColor)),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Expanded(child: Image.network(image)),
//             Text(
//               name,
//               textAlign: TextAlign.center,
//             ),
//             Text(
//               desc,
//               textAlign: TextAlign.center,
//               maxLines: 2,
//               style: kItemDescription(),
//             ),
//             Text(price, style: kItemPrice()),
//           ],
//         ),
//         // color: Colors.white,
//       ),
//     );
//   }
// }
