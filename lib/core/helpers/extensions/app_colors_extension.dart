import 'package:flutter/material.dart';

class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  AppColorsExtension({
    this.bgWhite = Colors.white,
    this.surfacesDark = const Color(0xff8E97A2),
    this.surfacesGray = const Color(0xffE7E7EA),
    this.surfacesGray2 = const Color(0xffF7F9FC),
    this.surfacesGray3 = const Color(0xffF8F8F9),
    this.surfacesGray4 = const Color(0xffE7E7EA),
    this.surfacesGray5 = const Color(0xffF8F8F9),
    this.surfacesGray6 = const Color(0xffC7C7CC),
    this.surfacesGray7 = const Color(0xffF6F6F6),
    this.surfacesWhite = Colors.white,
    this.surfacesWhite2 = Colors.white,
    this.surfacesWhite3 = Colors.white,
    this.surfacesWhite4 = Colors.white,
    this.inputFillColorWhite = Colors.white,
    this.primaryColor = const Color(0xff1D55F3),
    this.lightPrimaryColor = const Color(0xff496EF3),
    this.green100 = const Color(0xffDAF0EA),
    this.green200 = const Color(0xff00D159),
    this.green600 = const Color(0xff53DC95),
    this.greenDark = const Color(0xffDDFFEC),
    this.red100 = const Color(0xffFFE8E1),
    this.red200 = const Color(0xffFFE8E1),
    this.redDark = const Color(0xffFFE8E1),
    this.blue100 = const Color(0xffE5F4FF),
    this.blue200 = const Color(0xffD9EBFE),
    this.blue300 = const Color(0xffDCEDFF),
    this.blue400 = const Color(0xffDCEDFF),
    this.blue500 = const Color(0xffDCEDFF),
    this.blue600 = const Color(0xff6A89B4),
    this.blue700 = const Color(0xffF0F9FF),
    this.blue800 = const Color(0xffDCEDFF),
    this.yellow100 = const Color(0xffFEF7E4),
    this.yellow200 = const Color(0xffFFF7E2),
    this.yellow300 = const Color(0xffFFF7E3),
    this.yellow400 = const Color(0xffFFF6E0),
    this.blueDark = const Color(0xff192D3F),
    this.pageHeaderColor = Colors.white,
    this.dividerColor = const Color(0xffD0D0D4),
    this.btnBlackColor = Colors.black,
    this.btnGrayColor = const Color(0xffE8E9EB),
    this.lightGrey300 = const Color(0xffD0D0D5),
    this.purple100 = const Color(0xffF2EFFD),
    this.purple300 = const Color(0xff7E5CEB),
    this.beige100 = const Color(0xffFFF2EE),
    this.beige400 = const Color(0xffE5A5A1),
    this.circleYellow300 = const Color(0xffFFC500),
    this.greyC0 = const Color(0xffc0c0c3),
    this.lightBlue = const Color(0xff7FD6FF),
    this.completedBlue = const Color(0xff0178FF),
    this.shimmerDark = const Color(0xff262626),
    this.blue1F = const Color(0xff1F88FF),
    this.grey333333 = const Color(0xff333333),
    this.grey22 = const Color(0xff222222),
    this.black1A = const Color(0xff1A1A1A),
    this.darkOrange = const Color(0xffE8AB00),
    this.grey58 = const Color(0xff959595),
    this.darkyellow = const Color(0xFFE8AB00),
    this.lightBlueF2F9FF = const Color(0xffF2F9FF),
    this.greyF5 = const Color(0xffF5F6FA),
  });

  final Color bgWhite;
  final Color surfacesDark;
  final Color surfacesGray;
  final Color surfacesGray2;
  final Color surfacesGray3;
  final Color surfacesGray4;
  final Color surfacesGray5;
  final Color surfacesGray6;
  final Color surfacesGray7;
  final Color surfacesWhite;
  final Color surfacesWhite2;
  final Color surfacesWhite3;
  final Color surfacesWhite4;
  final Color inputFillColorWhite;
  final Color primaryColor;
  final Color lightPrimaryColor;
  final Color green100;
  final Color green200;
  final Color green600;
  final Color greenDark;
  final Color red100;
  final Color red200;
  final Color redDark;
  final Color blue100;
  final Color blue200;
  final Color blue300;
  final Color blue400;
  final Color blue500;
  final Color blue600;
  final Color blue700;
  final Color blue800;
  final Color blueDark;
  final Color yellow100;
  final Color yellow200;
  final Color yellow300;
  final Color yellow400;
  final Color pageHeaderColor;
  final Color dividerColor;
  final Color btnBlackColor;
  final Color btnGrayColor;
  final Color lightGrey300;
  final Color purple100;
  final Color purple300;
  final Color beige100;
  final Color beige400;
  final Color circleYellow300;
  final Color greyC0;
  final Color lightBlue;
  final Color completedBlue;
  final Color shimmerDark;
  final Color blue1F;
  final Color grey333333;
  final Color grey22;
  final Color black1A;
  final Color darkOrange;
  final Color grey58;
  final Color? darkyellow;
  final Color lightBlueF2F9FF;
  final Color greyF5;

  @override
  ThemeExtension<AppColorsExtension> copyWith({
    Color? bgWhite,
    Color? surfacesDark,
    Color? surfacesGray,
    Color? surfacesGray2,
    Color? surfacesGray3,
    Color? surfacesGray4,
    Color? surfacesGray5,
    Color? surfacesGray6,
    Color? surfacesGray7,
    Color? surfacesWhite,
    Color? surfacesWhite2,
    Color? surfacesWhite3,
    Color? surfacesWhite4,
    Color? inputFillColorWhite,
    Color? lightPrimaryColor,
    Color? primaryColor,
    Color? green100,
    Color? green200,
    Color? green600,
    Color? greenDark,
    Color? red100,
    Color? red200,
    Color? redDark,
    Color? yellow100,
    Color? yellow200,
    Color? yellow300,
    Color? yellow400,
    Color? blue100,
    Color? blue200,
    Color? blue300,
    Color? blue400,
    Color? blue500,
    Color? blue600,
    Color? blue700,
    Color? blue800,
    Color? blueDark,
    Color? pageHeaderColor,
    Color? dividerColor,
    Color? btnBlackColor,
    Color? btnGrayColor,
    Color? lightGrey300,
    Color? purple100,
    Color? purple300,
    Color? beige100,
    Color? beige400,
    Color? circleYellow300,
    Color? greyE6,
    Color? greyC0,
    Color? lightBlue,
    Color? completedBlue,
    Color? shimmerDark,
    Color? blue1F,
    Color? grey333333,
    Color? grey22,
    Color? black1A,
    Color? darkOrange,
    Color? grey58,
    Color? darkyellow,
    Color? lightBlueF2F9FF,
    Color? greyF5,
  }) {
    return AppColorsExtension(
      bgWhite: bgWhite ?? this.bgWhite,
      surfacesDark: surfacesDark ?? this.surfacesDark,
      surfacesGray: surfacesGray ?? this.surfacesGray,
      surfacesGray2: surfacesGray2 ?? this.surfacesGray2,
      surfacesGray3: surfacesGray3 ?? this.surfacesGray3,
      surfacesGray4: surfacesGray4 ?? this.surfacesGray4,
      surfacesGray6: surfacesGray6 ?? this.surfacesGray6,
      surfacesGray7: surfacesGray7 ?? this.surfacesGray7,
      surfacesWhite: surfacesWhite ?? this.surfacesWhite,
      surfacesWhite2: surfacesWhite2 ?? this.surfacesWhite2,
      surfacesWhite3: surfacesWhite3 ?? this.surfacesWhite3,
      surfacesWhite4: surfacesWhite4 ?? this.surfacesWhite4,
      surfacesGray5: surfacesGray5 ?? this.surfacesGray5,
      inputFillColorWhite: inputFillColorWhite ?? this.inputFillColorWhite,
      primaryColor: primaryColor ?? this.primaryColor,
      lightPrimaryColor: lightPrimaryColor ?? this.lightPrimaryColor,
      green100: green100 ?? this.green100,
      green200: green200 ?? this.green200,
      green600: green600 ?? this.green600,
      greenDark: greenDark ?? this.greenDark,
      blue100: blue100 ?? this.blue100,
      red100: red100 ?? this.red100,
      red200: red200 ?? this.red200,
      redDark: redDark ?? this.redDark,
      blue200: blue200 ?? this.blue200,
      blue300: blue300 ?? this.blue300,
      blue400: blue400 ?? this.blue400,
      blue500: blue500 ?? this.blue500,
      blue600: blue600 ?? this.blue600,
      blue700: blue700 ?? this.blue700,
      blue800: blue800 ?? this.blue800,
      blueDark: blueDark ?? this.blueDark,
      yellow100: yellow100 ?? this.yellow100,
      yellow200: yellow200 ?? this.yellow200,
      yellow300: yellow300 ?? this.yellow300,
      yellow400: yellow400 ?? this.yellow400,
      pageHeaderColor: pageHeaderColor ?? this.pageHeaderColor,
      dividerColor: dividerColor ?? this.dividerColor,
      btnBlackColor: btnBlackColor ?? this.btnBlackColor,
      btnGrayColor: btnGrayColor ?? this.btnGrayColor,
      lightGrey300: lightGrey300 ?? this.lightGrey300,
      purple100: purple100 ?? this.purple100,
      purple300: purple300 ?? this.purple300,
      beige100: beige100 ?? this.beige100,
      beige400: beige400 ?? this.beige400,
      circleYellow300: circleYellow300 ?? this.circleYellow300,
      greyC0: greyC0 ?? this.greyC0,
      lightBlue: lightBlue ?? this.lightBlue,
      completedBlue: completedBlue ?? this.completedBlue,
      shimmerDark: shimmerDark ?? this.shimmerDark,
      blue1F: blue1F ?? this.blue1F,
      grey333333: grey333333 ?? this.grey333333,
      grey22: grey22 ?? this.grey22,
      black1A: black1A ?? this.black1A,
      darkOrange: darkOrange ?? this.darkOrange,
      grey58: grey58 ?? this.grey58,
      darkyellow: darkyellow ?? this.darkyellow,
      lightBlueF2F9FF: lightBlueF2F9FF ?? this.lightBlueF2F9FF,
      greyF5: greyF5 ?? this.greyF5,
    );
  }

  @override
  ThemeExtension<AppColorsExtension> lerp(
    covariant ThemeExtension<AppColorsExtension>? other,
    double t,
  ) {
    if (other is! AppColorsExtension) return this;

    return AppColorsExtension(
      bgWhite: Color.lerp(bgWhite, other.bgWhite, t)!,
      surfacesDark: Color.lerp(surfacesDark, other.surfacesDark, t)!,
      surfacesGray: Color.lerp(surfacesGray, other.surfacesGray, t)!,
      surfacesGray2: Color.lerp(surfacesGray2, other.surfacesGray2, t)!,
      surfacesGray3: Color.lerp(surfacesGray3, other.surfacesGray3, t)!,
      surfacesGray4: Color.lerp(surfacesGray4, other.surfacesGray4, t)!,
      surfacesGray6: Color.lerp(surfacesGray6, other.surfacesGray6, t)!,
      surfacesGray7: Color.lerp(surfacesGray7, other.surfacesGray7, t)!,
      surfacesWhite: Color.lerp(surfacesWhite, other.surfacesWhite, t)!,
      surfacesWhite2: Color.lerp(surfacesWhite2, other.surfacesWhite2, t)!,
      surfacesWhite3: Color.lerp(surfacesWhite3, other.surfacesWhite3, t)!,
      surfacesWhite4: Color.lerp(surfacesWhite4, other.surfacesWhite4, t)!,
      surfacesGray5: Color.lerp(surfacesGray5, other.surfacesGray5, t)!,
      inputFillColorWhite: Color.lerp(
        inputFillColorWhite,
        other.inputFillColorWhite,
        t,
      )!,
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      lightPrimaryColor: Color.lerp(
        lightPrimaryColor,
        other.lightPrimaryColor,
        t,
      )!,
      green100: Color.lerp(green100, other.green100, t)!,
      greenDark: Color.lerp(greenDark, other.greenDark, t)!,
      green200: Color.lerp(green200, other.green200, t)!,
      green600: Color.lerp(green600, other.green600, t)!,
      red100: Color.lerp(red100, other.red100, t)!,
      red200: Color.lerp(red200, other.red200, t)!,
      redDark: Color.lerp(redDark, other.redDark, t)!,
      blue100: Color.lerp(blue100, other.blue100, t)!,
      blue200: Color.lerp(blue200, other.blue200, t)!,
      blue300: Color.lerp(blue300, other.blue300, t)!,
      blue400: Color.lerp(blue400, other.blue400, t)!,
      blue500: Color.lerp(blue500, other.blue500, t)!,
      blue600: Color.lerp(blue600, other.blue600, t)!,
      blue700: Color.lerp(blue700, other.blue700, t)!,
      blue800: Color.lerp(blue800, other.blue800, t)!,
      blueDark: Color.lerp(blueDark, other.blueDark, t)!,
      yellow100: Color.lerp(yellow100, other.yellow100, t)!,
      yellow200: Color.lerp(yellow200, other.yellow200, t)!,
      yellow300: Color.lerp(yellow300, other.yellow300, t)!,
      yellow400: Color.lerp(yellow400, other.yellow400, t)!,
      pageHeaderColor: Color.lerp(pageHeaderColor, other.pageHeaderColor, t)!,
      dividerColor: Color.lerp(dividerColor, other.dividerColor, t)!,
      btnBlackColor: Color.lerp(btnBlackColor, other.btnBlackColor, t)!,
      btnGrayColor: Color.lerp(btnGrayColor, other.btnGrayColor, t)!,
      lightGrey300: Color.lerp(lightGrey300, other.lightGrey300, t)!,
      purple100: Color.lerp(purple100, other.purple100, t)!,
      purple300: Color.lerp(purple300, other.purple300, t)!,
      beige100: Color.lerp(beige100, other.beige100, t)!,
      beige400: Color.lerp(beige400, other.beige400, t)!,
      circleYellow300: Color.lerp(circleYellow300, other.circleYellow300, t)!,
      greyC0: Color.lerp(greyC0, other.greyC0, t)!,
      lightBlue: Color.lerp(lightBlue, other.lightBlue, t)!,
      completedBlue: Color.lerp(completedBlue, other.completedBlue, t)!,
      shimmerDark: Color.lerp(shimmerDark, other.shimmerDark, t)!,
      blue1F: Color.lerp(blue1F, other.blue1F, t)!,
      grey333333: Color.lerp(grey333333, other.grey333333, t)!,
      grey22: Color.lerp(grey22, other.grey22, t)!,
      black1A: Color.lerp(black1A, other.black1A, t)!,
      darkOrange: Color.lerp(darkOrange, other.darkOrange, t)!,
      grey58: Color.lerp(grey58, other.grey58, t)!,
      darkyellow: Color.lerp(darkyellow, other.darkyellow, t)!,
      lightBlueF2F9FF: Color.lerp(lightBlueF2F9FF, other.lightBlueF2F9FF, t)!,
      greyF5: Color.lerp(greyF5, other.greyF5, t)!,
    );
  }
}
