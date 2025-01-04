import 'package:flutter/material.dart';


extension TextStyleExtension on TextStyle {
  //Font Weight
  TextStyle get thin => copyWith(fontWeight: FontWeight.w100);
  TextStyle get extraLight => copyWith(fontWeight: FontWeight.w200);
  TextStyle get light => copyWith(fontWeight: FontWeight.w300);
  TextStyle get normal => copyWith(fontWeight: FontWeight.w400);
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
  TextStyle get extraBold => copyWith(fontWeight: FontWeight.w800);
  TextStyle get thick => copyWith(fontWeight: FontWeight.w900);

  // Font Style & Text Decoration
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);
  TextStyle get overline => copyWith(decoration: TextDecoration.overline);
  TextStyle get underline => copyWith(decoration: TextDecoration.underline);
  TextStyle get lineThrough => copyWith(decoration: TextDecoration.lineThrough);



  // custom Color
  TextStyle colour(Color color) => copyWith(color: color);

//   TextStyle get yellow => copyWith(color: AppColor.f);
//   TextStyle get lightyellow => copyWith(color: AppColor.lightyellow);
//   TextStyle get brown => copyWith(color: AppColor.brown);
//   TextStyle get lightGrey => copyWith(color: AppColor.lightGrey);
//   TextStyle get grey => copyWith(color: AppColor.grey);
//   TextStyle get darkGrey => copyWith(color: AppColor.darkGrey);
}
