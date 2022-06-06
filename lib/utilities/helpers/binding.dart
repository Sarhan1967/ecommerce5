import 'package:ecommerce5_ui/controllers/auth_controller.dart';
import 'package:ecommerce5_ui/controllers/screens_controller.dart';
import 'package:ecommerce5_ui/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../../controllers/cart_controller.dart';
import '../../controllers/favouriteController.dart';
import '../services/databases/local_storage_data.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => ScreenController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => CartController());
    Get.lazyPut(() => LocalStorageData());
    //Get.lazyPut(() => CheckOutController());
    Get.lazyPut(() => FavouriteController());

  }
}
