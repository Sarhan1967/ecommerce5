import 'package:ecommerce5_ui/controllers/auth_controller.dart';
import 'package:ecommerce5_ui/views/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants.dart';

class RegisterView extends GetWidget<AuthController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? email;
  String? password;

  //bool remember = false;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Get.off(LoginView());
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          right: 20,
          left: 20,
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.01), // 4%
                Text(
                  "Register Account",
                  style: TextStyle(
                    fontSize: getWRatio(36),
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Complete your details or continue \nwith social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                nameFormField(),
                SizedBox(height: getHRatio(30)),
                emailFormField(),
                SizedBox(height: getHRatio(30)),
                passwordFormField(),
                SizedBox(height: getHRatio(30)),
                DefaultButton(
                  text: "Sign Up",
                  onPress: () {
                    _formKey.currentState!.save();

                    if (_formKey.currentState!.validate()) {
                      controller.createAccountWithEmailAndPassword();
                      Get.off(() => LoginView());
                    }
                  },
                ),
                SizedBox(height: getHRatio(30)),
                Text(
                  'By continuing your confirm that you agree \nwith our Term and Condition',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField nameFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        controller.name = value;
      },
      validator: (value) {
        if (value == null) {
          print("ERROR");
        }
      },
      decoration: const InputDecoration(
        labelText: "Name",
        hintText: "Enter your Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/menu_icon/User.svg"),
      ),
    );
  }

  TextFormField emailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        controller.email = value;
      },
      validator: (value) {
        if (value == null) {
          print("ERROR");
        }
      },
      decoration: const InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/menu_icon/Mail.svg"),
      ),
    );
  }

  TextFormField passwordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (value) {
        controller.password = value;
      },
      validator: (value) {
        if (value == null) {
          print('error');
        }
      },
      decoration: const InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/menu_icon/Lock.svg"),
      ),
    );
  }

}
