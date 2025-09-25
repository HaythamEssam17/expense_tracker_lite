import 'package:flutter/material.dart';

class TextColorsExtension extends ThemeExtension<TextColorsExtension> {
  TextColorsExtension({
    this.white = Colors.white,
    this.black = Colors.black,
    this.main = const Color(0xff101F29),
    this.light = const Color(0xff8D8D91),
    this.error = const Color(0xffF72C00),
    this.darkBlue = const Color(0xff6A89B4),
    this.grayLight = const Color(0xff838389),
    this.red = const Color(0xffF72C00),
    this.greyGainsboro = const Color(0xffE7E7EA),
    this.ohersBlue = const Color(0xff003269),
    this.darkOrange = const Color(0xffCF8230),
    this.lightGrey300 = const Color(0xffD0D0D5),
    this.deepOrange = const Color(0xff955214),
    this.lightGrey = const Color(0xffC7C7C7),
    this.darkDaysBlue = const Color(0xffE8AB00),
    this.blueBlack = const Color(0xff273443),
    this.darkRed = const Color(0xffE40922),
    this.gray = const Color(0xff8C969F),
    this.grayLightD1 = const Color(0xffD1D1D6),
    this.grayLightD0 = const Color(0xffD0D0D5),
  });

  final Color white;
  final Color black;
  final Color main;
  final Color light;
  final Color error;
  final Color darkBlue;
  final Color grayLight;
  final Color red;
  final Color darkDaysBlue;
  final Color greyGainsboro;
  final Color ohersBlue;
  final Color darkOrange;
  final Color lightGrey300;
  final Color deepOrange;
  final Color lightGrey;
  final Color darkRed;
  final Color gray;
  final Color blueBlack;
  final Color grayLightD1;
  final Color grayLightD0;

  @override
  ThemeExtension<TextColorsExtension> copyWith({
    Color? white,
    Color? black,
    Color? main,
    Color? error,
    Color? light,
    Color? darkBlue,
    Color? grayLight,
    Color? red,
    Color? darkDaysBlue,
    Color? greyGainsboro,
    Color? ohersBlue,
    Color? darkOrange,
    Color? lightGrey300,
    Color? deepOrange,
    Color? lightGrey,
    Color? blueBlack,
    Color? darkRed,
    Color? gray,
    Color? grayLightD1,
    Color? grayLightD0,
  }) {
    return TextColorsExtension(
      white: white ?? this.white,
      black: black ?? this.black,
      main: main ?? this.main,
      light: light ?? this.light,
      error: error ?? this.error,
      darkBlue: darkBlue ?? this.darkBlue,
      grayLight: grayLight ?? this.grayLight,
      red: red ?? this.red,
      darkDaysBlue: darkDaysBlue ?? this.darkDaysBlue,
      greyGainsboro: greyGainsboro ?? this.greyGainsboro,
      ohersBlue: ohersBlue ?? this.ohersBlue,
      darkOrange: darkOrange ?? this.darkOrange,
      lightGrey300: lightGrey300 ?? this.lightGrey300,
      deepOrange: deepOrange ?? this.deepOrange,
      lightGrey: lightGrey ?? this.lightGrey,
      darkRed: darkRed ?? this.darkRed,
      gray: gray ?? this.gray,
      blueBlack: blueBlack ?? this.blueBlack,
      grayLightD1: grayLightD1 ?? this.grayLightD1,
      grayLightD0: grayLightD0 ?? this.grayLightD0,
    );
  }

  @override
  ThemeExtension<TextColorsExtension> lerp(
    covariant ThemeExtension<TextColorsExtension>? other,
    double t,
  ) {
    if (other is! TextColorsExtension) return this;

    return TextColorsExtension(
      white: Color.lerp(white, other.white, t)!,
      black: Color.lerp(black, other.black, t)!,
      main: Color.lerp(main, other.main, t)!,
      light: Color.lerp(light, other.light, t)!,
      error: Color.lerp(error, other.error, t)!,
      darkBlue: Color.lerp(darkBlue, other.darkBlue, t)!,
      grayLight: Color.lerp(grayLight, other.grayLight, t)!,
      red: Color.lerp(red, other.red, t)!,
      darkDaysBlue: Color.lerp(darkDaysBlue, other.darkDaysBlue, t)!,
      greyGainsboro: Color.lerp(greyGainsboro, other.greyGainsboro, t)!,
      ohersBlue: Color.lerp(ohersBlue, other.ohersBlue, t)!,
      darkOrange: Color.lerp(darkOrange, other.darkOrange, t)!,
      lightGrey300: Color.lerp(lightGrey300, other.lightGrey300, t)!,
      deepOrange: Color.lerp(deepOrange, other.deepOrange, t)!,
      lightGrey: Color.lerp(lightGrey, other.lightGrey, t)!,
      blueBlack: Color.lerp(blueBlack, other.blueBlack, t)!,
      darkRed: Color.lerp(darkRed, other.darkRed, t)!,
      gray: Color.lerp(gray, other.gray, t)!,
      grayLightD1: Color.lerp(grayLightD1, other.grayLightD1, t)!,
      grayLightD0: Color.lerp(grayLightD0, other.grayLightD0, t)!,
    );
  }
}
