import 'package:ecommerce5_ui/controllers/profile_controller.dart';
import 'package:ecommerce5_ui/views/login.dart';
import 'package:ecommerce5_ui/views/profile/edit_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

import '../constants.dart';
import 'cart.dart';
import 'favourite.dart';
import 'home.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) => controller.loading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
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
              body: Container(
                padding: EdgeInsets.only(top: 50),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(100),
                                ),
                                image: DecorationImage(
                                  image: controller.userModel == null
                                      ? AssetImage('assets/images/pro1.jpg')
                                      : (controller.userModel!.pic == 'default'
                                          ? AssetImage('assets/images/pro1.jpg')
                                          : NetworkImage(controller.userModel!
                                              .pic!)) as ImageProvider<Object>,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                CustomText(
                                  text: controller.userModel!.name,
                                  color: Colors.black,
                                  fontSize: 32,
                                ),
                                CustomText(
                                  text: controller.userModel!.email,
                                  color: Colors.black,
                                  fontSize: 24,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Container(
                        child: FlatButton(
                          onPressed: () {
                            //Get.to(EditProfileView());
                          },
                          child: ListTile(
                            title: CustomText(
                              text: 'Edit Profile',
                            ),
                            leading: Image.asset(
                              'assets/menu_icon/Icon_Edit-Profile.png',
                            ),
                            trailing: Icon(
                              Icons.navigate_next,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: FlatButton(
                          onPressed: () {},
                          child: ListTile(
                            title: CustomText(
                              text: 'Shipping adress',
                            ),
                            leading: Image.asset(
                              'assets/menu_icon/Icon_Location.png',
                            ),
                            trailing: Icon(
                              Icons.navigate_next,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: FlatButton(
                          onPressed: () {},
                          child: ListTile(
                            title: CustomText(
                              text: 'Order History',
                            ),
                            leading: Image.asset(
                              'assets/menu_icon/Icon_History.png',
                            ),
                            trailing: Icon(
                              Icons.navigate_next,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: FlatButton(
                          onPressed: () {},
                          child: ListTile(
                            title: CustomText(
                              text: 'Cards',
                            ),
                            leading: Image.asset(
                              'assets/menu_icon/Icon_Payment.png',
                            ),
                            trailing: Icon(
                              Icons.navigate_next,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: FlatButton(
                          onPressed: () {},
                          child: ListTile(
                            title: CustomText(
                              text: 'Notification',
                            ),
                            leading: Image.asset(
                              'assets/menu_icon/Icon_Alert.png',
                            ),
                            trailing: Icon(
                              Icons.navigate_next,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: FlatButton(
                          onPressed: () {
                            controller.signOut();
                            Get.offAll(LoginView());
                          },
                          child: ListTile(
                            title: CustomText(
                              text: 'Log Out',
                            ),
                            leading: Image.asset(
                              'assets/menu_icon/Icon_Exit.png',
                            ),
                            trailing: Icon(
                              Icons.navigate_next,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
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
              Get.to(() => ProfileView());
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
          // ListTile(
          //   title: Text(
          //     "Privacy Policy",
          //   ),
          // ),
        ],
      ),
    );
  }
}
