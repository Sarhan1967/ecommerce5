import 'dart:async';
import 'dart:core';

import 'package:ecommerce5_ui/controllers/home_controller.dart';
import 'package:ecommerce5_ui/utilities/services/databases/local_storage_data.dart';
import 'package:ecommerce5_ui/utilities/services/firestore_user.dart';
import 'package:ecommerce5_ui/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  //instant from GoogleSignIn--------
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  //instant from FirebaseSignIn--------
  FirebaseAuth _auth = FirebaseAuth.instance;

  String? email, password, name;

  //Rxn<User?>? _user = Rxn()<User?>();
  Rxn<User?> _user = Rxn<User?>();

  String? get user => _user.value?.email;

  //instance from LocalStorageData----
  final LocalStorageData localStorageData = Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
    if(_auth.currentUser !=null){
      getCurrentUserData(_auth.currentUser!.uid);

    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount googleUser = await (_googleSignIn.signIn() as FutureOr<GoogleSignInAccount>);
    print(googleUser);
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    await _auth.signInWithCredential(credential).then((user) {
      saveUser(user);
      //Get.offAll(HomeView());
      Get.offAll(HomeController());
    });
  }

  void facebookSignInMethod() async {
    final AccessToken result = await (FacebookAuth.instance.login() as FutureOr<AccessToken>);

    final FacebookAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(result.token) as FacebookAuthCredential;

    await _auth.signInWithCredential(facebookAuthCredential).then((user) {
      saveUser(user);
    });
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email!, password: password!)
          //fetch user data from firebase----
          .then((value) async {
            getCurrentUserData(value.user!.uid);
      });
      Get.offAll(()=>HomeController());
    }on FirebaseException catch (e) {
      print(e.message.toString());
      Get.snackbar(
        'Error login account',
        e.message.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void createAccountWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email!, password: password!)
          .then((user) async {
        saveUser(user);
      });
      Get.offAll(()=>HomeController());
    }on FirebaseException catch (e) {
      print(e.message.toString());
      Get.snackbar(
        'Error login account',
        e.message.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void saveUser(UserCredential user) async {
    UserModel userModel = UserModel(
      userId: user.user!.uid,
      email: user.user!.email,
      name: name == null ? user.user!.displayName : name,
      pic: '',
    );
    await FireStoreUser().addUserToFireStore(userModel);
    setUser(userModel);
  }

  void getCurrentUserData(String uid)async{
    await FireStoreUser().getCurrentUser(uid).then((value) {
      setUser(UserModel.fromJson(value.data() as Map<dynamic, dynamic>?));
    });
  }


//to save user in SharedPreferences----
  void setUser(UserModel userModel) async {
    await localStorageData.setUser(userModel);
  }
}
