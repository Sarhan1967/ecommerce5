
import 'package:ecommerce5_ui/views/cart.dart';
import 'package:ecommerce5_ui/views/favourite.dart';
import 'package:ecommerce5_ui/views/home.dart';
import 'package:ecommerce5_ui/views/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenController extends GetxController {
  int _navigatorValue = 0;

  get navigatorValue => _navigatorValue;

  Widget currentScreen = HomeView();

  void changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        {
          currentScreen = HomeView();
          break;
        }
      case 1:
        {
          currentScreen = CartView();
          break;
        }
      case 2:
        {
          currentScreen = FavouriteView();
          break;
        }
      case 3:
        {
          currentScreen = ProfileView();
          break;
        }
    }
    update();
  }
}
