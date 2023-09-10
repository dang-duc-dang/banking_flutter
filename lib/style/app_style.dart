import 'package:food_flutter/helpers/extension/responsive.dart';
import 'package:flutter/material.dart';

class Style {
  Style();

  //Netural Colour
  static const Color black = Color(0xff000000);
  static const Color gray1 = Color(0xff484848);
  static const Color gray2 = Color(0xff797979);
  static const Color gray3 = Color(0xffA9A9A9);
  static const Color gray4 = Color(0xffD9D9D9);
  static const Color white = Color(0xffFFFFFF);

  //Primary
  static const Color primary100 = Color(0xff129575);
  static const Color primary80 = Color(0xff71B1A1);
  static const Color primary60 = Color(0xffAFD3CA);
  static const Color primary40 = Color(0xffDBEBE7);
  static const Color primary20 = Color(0xffF6FAF9);

  //Secondary
  static const Color secondary100 = Color(0xffFF9C00);
  static const Color secondary80 = Color(0xffFFA61A);
  static const Color secondary60 = Color(0xffFFBA4D);
  static const Color secondary40 = Color(0xffFFCE80);
  static const Color secondary20 = Color(0xffFFE1B3);
  static const Color rating = Color(0xffFFAD30);
  static const Color warning = Color(0xff804E00);
  static const Color warning1 = Color(0xff995E00);
  static const Color success = Color(0xff31B057);

  //Text style
  static const String fontBold = "Poppins-Bold";
  static const String fontSemiBold = "Poppins-SemiBold";
  static const String fontMedium = "Poppins-Medium";
  static const String fontRegular = "Poppins-Regular";

  TextStyle textStyle({
    double? height,
    double? letterSpacing,
    double? fontSize,
    String? fontFamily,
    Color? color,
  }) =>
      TextStyle(
        color: color ?? black,
        fontFamily: fontFamily ?? fontSemiBold,
        fontSize: fontSize ?? 14.sp,
      );
//bold
  TextStyle tittleTextBold = TextStyle(
    fontFamily: fontBold,
    fontSize: 30.sp,
  );
  TextStyle headerTitle = TextStyle(
    fontFamily: fontBold,
    fontSize: 60.sp,
  );
  TextStyle headerTextBold = TextStyle(
    fontFamily: fontBold,
    fontSize: 30.sp,
  );
  TextStyle largeTextBold = TextStyle(
    fontFamily: fontBold,
    fontSize: 20.sp,
  );
  TextStyle mediumTextBold = TextStyle(
    fontFamily: fontBold,
    fontSize: 16.sp,
  );
  TextStyle normalTextBold = TextStyle(
    fontFamily: fontBold,
    fontSize: 18.sp,
  );
  TextStyle smallTextBold = TextStyle(
    fontFamily: fontBold,
    fontSize: 14.sp,
  );
  TextStyle smallerTextBold = TextStyle(
    fontFamily: fontBold,
    fontSize: 11.sp,
  );

// Regular

  TextStyle headerTextRegular = TextStyle(
    fontFamily: fontRegular,
    fontSize: 30.sp,
  );
  TextStyle largeTextRegular = TextStyle(
    fontFamily: fontRegular,
    fontSize: 20.sp,
  );
  TextStyle mediumTextRegular = TextStyle(
    fontFamily: fontRegular,
    fontSize: 18.sp,
  );
  TextStyle normalTextRegular = TextStyle(
    fontFamily: fontRegular,
    fontSize: 16.sp,
  );
  TextStyle smallTextRegular = TextStyle(
    fontFamily: fontRegular,
    fontSize: 14.sp,
  );
  TextStyle smallerTextRegular = TextStyle(
    fontFamily: fontRegular,
    fontSize: 11.sp,
  );

  ///fontSemiBold
  TextStyle headerTextSemiBold = TextStyle(
    fontFamily: fontSemiBold,
    fontSize: 30.sp,
  );
  TextStyle largeTextSemiBold = TextStyle(
    fontFamily: fontSemiBold,
    fontSize: 20.sp,
  );
  TextStyle mediumTextSemiBold = TextStyle(
    fontFamily: fontSemiBold,
    fontSize: 18.sp,
  );
  TextStyle normalTextSemiBold = TextStyle(
    fontFamily: fontSemiBold,
    fontSize: 16.sp,
  );
  TextStyle smallTextSemiBold = TextStyle(
    fontFamily: fontSemiBold,
    fontSize: 14.sp,
  );
  TextStyle smallerTextSemiBold = TextStyle(
    fontFamily: fontSemiBold,
    fontSize: 11.sp,
  );
  TextStyle labelRegular = TextStyle(
    fontFamily: fontRegular,
    fontSize: 14.sp,
  );
}
