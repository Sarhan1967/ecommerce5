import 'package:ecommerce5_ui/utilities/helpers/binding.dart';
import 'package:ecommerce5_ui/views/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/cart_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(CartController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      home: Scaffold(
        body: SplashPage(),
      ),
      theme: ThemeData(
        fontFamily: 'SourceSansPro',
      ),
    );
  }
}
