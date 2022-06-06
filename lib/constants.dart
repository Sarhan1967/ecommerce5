import 'dart:ffi';

import 'package:ecommerce5_ui/views/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'models/Product.dart';

//SizeConfig-----------------------
class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

// Get the proportionate height as per screen size------------
double getHRatio(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate width as per screen size
double getWRatio(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * screenWidth;
}

//--CustomText---------------------
class CustomText extends StatelessWidget {
  final String? text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final Alignment alignment;
  final int? maxLine;
  final double height;

  CustomText({
    this.text = '',
    this.fontSize = 18,
    this.color = Colors.black,
    this.fontWeight = FontWeight.normal,
    this.alignment = Alignment.topLeft,
    this.maxLine,
    this.height = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text!,
        style: TextStyle(
          color: color,
          fontWeight: fontWeight,
          height: height,
          fontSize: fontSize,
        ),
        maxLines: maxLine,
      ),
    );
  }
}

//--Head Text---------------------
class HeadText extends StatelessWidget {
  final String? text;
  final double fontSize;
  final Color color;
  final Alignment alignment;
  final int? maxLine;
  final double height;

  HeadText({
    this.text = '',
    this.fontSize = 18,
    this.color = Colors.black,
    this.alignment = Alignment.topLeft,
    this.maxLine,
    this.height = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text!,
        style: TextStyle(
          color: color,
          height: height,
          fontSize: fontSize,
        ),
        maxLines: maxLine,
      ),
    );
  }
}

//CustomTextFormField-----------------------------
class CustomTextFormField extends StatelessWidget {
  final String? text;
  final String? hint;
  final void Function(String?)? onSave;
  final String initialValue;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool obscureText;

  CustomTextFormField({
    this.text,
    this.hint,
    this.onSave,
    this.initialValue = '',
    this.keyboardType,
    this.validator,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomText(
            text: text,
            fontSize: 18,
            color: Colors.grey.shade900,
          ),
          TextFormField(
            onSaved: onSave,
            validator: validator,
            keyboardType: keyboardType,
            obscureText: obscureText,
            initialValue: initialValue,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(
                color: Colors.black,
              ),
              fillColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    this.text,
    this.onPress,
  }) : super(key: key);
  final String? text;
  final Function? onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getHRatio(56),
      child: TextButton(
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          primary: Colors.white,
          backgroundColor: kPrimaryColor,
        ),
        onPressed: onPress as void Function()?,
        child: Text(
          text!,
          style: TextStyle(
            fontSize: getWRatio(22),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final Function? onPress;

  CustomButton({
    required this.onPress,
    this.text = 'Write text ',
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getHRatio(56),
      child: TextButton(
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          primary: Colors.white,
          backgroundColor: kPrimaryColor,
        ),
        onPressed: onPress as void Function()?,
        child: CustomText(
          alignment: Alignment.center,
          text: text,
          color: textColor,
        ),
      ),
    );
  }
}

// headingStyle-----------------
final headingStyle = TextStyle(
  fontSize: getWRatio(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

TextStyle kItemTitle() {
  return TextStyle(
    fontSize: 18,
  );
}

TextStyle kItemPrice() {
  return TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );
}

TextStyle kItemDescription() {
  return TextStyle(
    fontSize: 14,
    color: Colors.grey,
  );
}


class KeyboardUtil {
  static void hideKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}

class CustomSuffixIcon extends StatelessWidget {
  const CustomSuffixIcon({
    Key? key,
    required this.svgIcon,
  }) : super(key: key);

  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        0,
        getWRatio(20),
        getWRatio(20),
        getWRatio(20),
      ),
      child: SvgPicture.asset(
        svgIcon,
        height: getWRatio(18),
      ),
    );
  }
}

class RoundedIconBtn extends StatelessWidget {
  const RoundedIconBtn({
    Key? key,
    required this.icon,
    required this.press,
    this.showShadow = false,
  }) : super(key: key);

  final IconData icon;
  final GestureTapCancelCallback press;
  final bool showShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHRatio(40),
      width: getWRatio(40),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          if (showShadow)
            BoxShadow(
              offset: const Offset(0, 6),
              blurRadius: 10,
              color: const Color(0xFFB0B0B0).withOpacity(0.2),
            ),
        ],
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          primary: kPrimaryColor,
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        ),
        onPressed: press,
        child: Icon(icon),
      ),
    );
  }
}

class SocialCard extends StatelessWidget {
  const SocialCard({
    Key? key,
    this.imageName,
    this.onPress,
  }) : super(key: key);

  final String? imageName;
  final Function? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress as void Function()?,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: getWRatio(10)),
        padding: EdgeInsets.all(getWRatio(12)),
        height: getHRatio(50),
        width: getWRatio(50),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        //child: SvgPicture.asset(icon!),
        child: Image.asset(imageName!),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final String? text;
  final String? imageName;
  final Function? onPress;

  SocialButton({
    required this.text,
    required this.imageName,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getHRatio(56),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.orange[50],
        ),
        child: OutlinedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: BorderSide(color: Colors.blue)),
            ),
              backgroundColor: MaterialStateProperty.all(const Color(0xfff7faa7)),
              padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 30)),
              textStyle: MaterialStateProperty.all(
                  const TextStyle(fontSize: 24, color: Colors.red))
          ),
          onPressed: onPress as void Function()?,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: text,
                color: Colors.deepOrange,
              ),
              Image.asset(imageName!),
            ],
          ),
        ),
      ),
    );
  }
}

//OpenFlutterEcommerceTheme---------
/*
class AppSizes {
  static const int splashScreenTitleFontSize = 48;
  static const int titleFontSize = 34;
  static const double sidePadding = 15;
  static const double widgetSidePadding = 20;
  static const double buttonRadius = 25;
  static const double imageRadius = 8;
  static const double linePadding = 4;
  static const double widgetBorderRadius = 34;
  static const double textFieldRadius = 4.0;
  static const EdgeInsets bottomSheetPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 10);
  static const app_bar_size = 56.0;
  static const app_bar_expanded_size = 180.0;
  static const tile_width = 148.0;
  static const tile_height = 276.0;
}
class AppColors {
  static const red = Color(0xFFDB3022);
  static const black = Color(0xFF222222);
  static const lightGray = Color(0xFF9B9B9B);
  static const darkGray = Color(0xFF979797);
  static const white = Color(0xFFFFFFFF);
  static const orange = Color(0xFFFFBA49);
  static const background = Color(0xFFE5E5E5);
  static const backgroundLight = Color(0xFFF9F9F9);
  static const transparent = Color(0x00000000);
  static const success = Color(0xFF2AA952);
  static const green = Color(0xFF2AA952);
}
class AppConsts {
  static const page_size = 20;
}
class OpenFlutterEcommerceTheme {
  static ThemeData of(context) {
    var theme = Theme.of(context);
    return theme.copyWith(
      primaryColor: AppColors.black,
      primaryColorLight: AppColors.lightGray,
      bottomAppBarColor: AppColors.lightGray,
      backgroundColor: AppColors.background,
      dialogBackgroundColor: AppColors.backgroundLight,
      errorColor: AppColors.red,
      dividerColor: Colors.transparent,
      appBarTheme: theme.appBarTheme.copyWith(
          color: AppColors.white,
          iconTheme: IconThemeData(color: AppColors.black), toolbarTextStyle: theme.textTheme.copyWith(
          caption: TextStyle(
            color: AppColors.black,
            fontSize: 18,
            fontFamily: 'Metropolis',
            fontWeight: FontWeight.w400,
          )).bodyText2, titleTextStyle: theme.textTheme.copyWith(
          caption: TextStyle(
            color: AppColors.black,
            fontSize: 18,
            fontFamily: 'Metropolis',
            fontWeight: FontWeight.w400,
          )).headline6),
      textTheme: theme.textTheme
          .copyWith(
        //over image white text
        headline5: theme.textTheme.headline5?.copyWith(
          fontSize: 48,
          color: AppColors.white,
          fontFamily: 'Metropolis',
          fontWeight: FontWeight.w900,
        ),
        headline6: theme.textTheme.headline6?.copyWith(
          fontSize: 24,
          color: AppColors.black,
          fontWeight: FontWeight.w900,
          fontFamily: 'Metropolis',
        ), //

        //product title
        headline4: theme.textTheme.headline4?.copyWith(
          color: AppColors.black,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontFamily: 'Metropolis',
        ),

        headline3: theme.textTheme.headline3?.copyWith(
          fontFamily: 'Metropolis',
          fontWeight: FontWeight.w400,
        ),
        //product price
        headline2: theme.textTheme.headline2?.copyWith(
          color: AppColors.lightGray,
          fontSize: 14,
          fontFamily: 'Metropolis',
          fontWeight: FontWeight.w400,
        ),
        headline1: theme.textTheme.headline1?.copyWith(
          fontFamily: 'Metropolis',
          fontWeight: FontWeight.w500,
        ),

        subtitle2: theme.textTheme.subtitle2?.copyWith(
          fontSize: 18,
          color: AppColors.black,
          fontFamily: 'Metropolis',
          fontWeight: FontWeight.w400,
        ),

        subtitle1: theme.textTheme.subtitle1?.copyWith(
          fontSize: 24,
          color: AppColors.darkGray,
          fontFamily: 'Metropolis',
          fontWeight: FontWeight.w500,
        ),
        //red button with white text
        button: theme.textTheme.button?.copyWith(
          fontSize: 14,
          color: AppColors.white,
          fontFamily: 'Metropolis',
          fontWeight: FontWeight.w500,
        ),
        //black caption title
        caption: theme.textTheme.caption?.copyWith(
          fontSize: 34,
          color: AppColors.black,
          fontFamily: 'Metropolis',
          fontWeight: FontWeight.w700,
        ),
        //light gray small text
        bodyText1: theme.textTheme.bodyText1?.copyWith(
          color: AppColors.lightGray,
          fontSize: 11,
          fontFamily: 'Metropolis',
          fontWeight: FontWeight.w400,
        ),
        //view all link
        bodyText2: theme.textTheme.bodyText2?.copyWith(
          color: AppColors.black,
          fontSize: 11,
          fontFamily: 'Metropolis',
          fontWeight: FontWeight.w400,
        ),
      )
          .apply(fontFamily: 'Metropolis'),
      buttonTheme: theme.buttonTheme.copyWith(
        minWidth: 50,
        buttonColor: AppColors.red,
      ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.red),
    );
  }
}
class OpenFlutterFavouriteButton extends StatelessWidget {
  final bool favourite;
  final VoidCallback setFavourite;
  final double size;
  final double iconSize;

  OpenFlutterFavouriteButton(
      {required Key key,
        required this.size,
        required this.iconSize,
        required this.favourite,
        required this.setFavourite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    return InkWell(
      onTap: setFavourite,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(color: _theme.primaryColorLight, blurRadius: 15),
          ],
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        height: size ?? 50,
        width: size ?? 50,
        child: favourite
            ? Icon(Icons.favorite,
            size: iconSize ?? 20, color: _theme.colorScheme.secondary)
            : Icon(Icons.favorite_border,
            size: iconSize ?? 20, color: _theme.primaryColorLight),
      ),
    );
  }
}

 */


//CustomBottomNavBar----------------------------------
/*
class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    const Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/Shop Icon.svg",
                  color: MenuState.home == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, HomeScreen.routeName),
              ),
              IconButton(
                icon: SvgPicture.asset("assets/icons/Heart Icon.svg"),
                onPressed: () {},
              ),
              IconButton(
                icon: SvgPicture.asset("assets/icons/Chat bubble Icon.svg"),
                onPressed: () {},
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/User Icon.svg",
                  color: MenuState.profile == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, ProfileScreen.routeName),
              ),
            ],
          )),
    );
  }
}
 */

//SectionTitle-------------------------
class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String title;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: getWRatio(18),
            color: Colors.black,
          ),
        ),
        GestureDetector(
          onTap: press,
          child: const Text(
            "See More",
            style: TextStyle(color: Color(0xFFBBBBBB)),
          ),
        ),
      ],
    );
  }
}

//CustomButtonSocial--------------------

class CustomButtonSocial extends StatelessWidget {
  final String? text;
  final String? imageName;
  final Function? onPress;

  CustomButtonSocial({
    required this.text,
    required this.imageName,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        color: Colors.grey.shade50,
      ),
      child: FlatButton(
        onPressed: onPress as void Function()?,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 100,
            ),
            CustomText(
              text: text,
            ),
            Image.asset(imageName!),
          ],
        ),
      ),
    );
  }
}

class IconBtnWithCounter extends StatelessWidget {
  const IconBtnWithCounter({
    Key? key,
    required this.svgSrc,
    this.numOfitem = 0,
    required this.press,
  }) : super(key: key);

  final String svgSrc;
  final int numOfitem;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: press,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.all(getWRatio(12)),
            height: getWRatio(46),
            width: getWRatio(46),
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(svgSrc),
          ),
          if (numOfitem != 0)
            Positioned(
              top: -3,
              right: 0,
              child: Container(
                height: getWRatio(16),
                width: getWRatio(16),
                decoration: BoxDecoration(
                  color: Color(0xFFFF4848),
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.5, color: Colors.white),
                ),
                child: Center(
                  child: Text(
                    "$numOfitem",
                    style: TextStyle(
                      fontSize: getWRatio(10),
                      height: 1,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.width = 140,
    this.aspectRatio = 1.02,
    required this.product,
  }) : super(key: key);

  final double width, aspectRatio;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getWRatio(20)),
      child: SizedBox(
        width: getWRatio(width),
        child: GestureDetector(
          onTap: (){
            Get.to(()=>DetailsView());
            //arguments: ProductDetailsArguments(product: product);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  padding: EdgeInsets.all(getWRatio(20)),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Hero(
                    tag: product.id.toString(),
                    child: Image.asset(product.images[0]),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                product.title,
                style: TextStyle(color: Colors.black),
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${product.price}",
                    style: TextStyle(
                      fontSize: getWRatio(18),
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(getWRatio(8)),
                      height: getWRatio(28),
                      width: getWRatio(28),
                      decoration: BoxDecoration(
                        color: product.isFavourite
                            ? kPrimaryColor.withOpacity(0.15)
                            : kSecondaryColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/Heart Icon_2.svg",
                        color: product.isFavourite
                            ? Color(0xFFFF4848)
                            : Color(0xFFDBDEE4),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

//colors--------------
const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],

);
const kTileHeight = 50.0;
const inProgressColor = Colors.black87;
const todoColor = Color(0xffd1d2d7);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

//----duration---------------
const defaultDuration = Duration(milliseconds: 250);
const kAnimationDuration = Duration(milliseconds: 200);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

//otp--------------------------
final otpInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: getWRatio(15)),
  border: outBorder(),
  focusedBorder: outBorder(),
  enabledBorder: outBorder(),
);

//cart text-------------------
const String tableFavouriteProduct = 'favouriteProduct';
const String tableCartProduct = 'cartProduct';
const String columnName = 'name';
const String columnImage = 'image';
const String columnQuantity = 'quantity';
const String columnIsFavourite = 'isFavourite';
const String columnPrice = 'price';
const String columnProductId = 'productId';
const primaryColor = Color.fromRGBO(0, 197, 105, 1);
const CASHED_USER_DATA = 'CASHED_USER_DATA';



//OutlineInputBorder------------------
OutlineInputBorder outBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getWRatio(15)),
    borderSide: const BorderSide(color: kTextColor),
  );
}
