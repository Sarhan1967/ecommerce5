import 'package:ecommerce5_ui/controllers/auth_controller.dart';
import 'package:ecommerce5_ui/views/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';

class LoginView extends GetWidget<AuthController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? email;
  String? password;
  bool? remember = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.only(
              top: 30,
              right: 20,
              left: 20,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.01),
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                      fontSize: getWRatio(36),
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Sign in with your email and password  \nor continue with social media",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.02),
                  emailFormField(),
                  SizedBox(height: getHRatio(30)),
                  passwordFormField(),
                  SizedBox(height: getHRatio(30)),
                  Row(
                    children: [
                      Checkbox(
                        value: remember,
                        activeColor: kPrimaryColor,
                        onChanged: (value) {
                          remember = value;
                        },
                      ),
                      const Text("Remember me"),
                      const Spacer(),
                      GestureDetector(
                        onTap: (){},
                            //=>
                            // Navigator.pushNamed(
                            //     context, ForgotPasswordScreen.routeName),
                        child: const Text(
                          "Forgot Password",
                          style: TextStyle(
                              decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: getHRatio(20)),
                  DefaultButton(
                    text: "Sign In",
                    onPress: () {
                      _formKey.currentState!.save();

                      if (_formKey.currentState!.validate()) {
                        controller.signInWithEmailAndPassword();
                      }
                    },
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.02),
                  CustomText(
                    text: '<====== OR ======>',
                    alignment: Alignment.center,
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.02),
                  SocialButton(
                    onPress: () {
                      //this controller from GetWidget<AuthController>------
                      controller.googleSignInMethod();
                    },
                    text: 'Sign In with Google',
                    imageName: 'assets/images/google.png',
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.02),
                  SocialButton(
                    text: 'Sign In with Facebook',
                    onPress: () {
                      controller.facebookSignInMethod();
                    },
                    imageName: 'assets/images/facebook.png',
                  ),
                  SizedBox(height: getHRatio(30)),
                  const NoAccountText(),

                ],
              ),
            ),

        ),
      ),
    );
  }

  TextFormField emailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (String? value) {
        controller.email = value;
      },
      validator: (String? value) {
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
      onSaved: (String? value) {
        controller.password = value;
      },
      validator: (String? value) {
        if (value == null) {
          print("ERROR");
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

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t have an account? ",
          style: TextStyle(fontSize: getWRatio(16)),
        ),
        GestureDetector(
          onTap: () {
            Get.to(RegisterView());
          },
          child: CustomText(
            text: "Sign Up",
            color: primaryColor,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
