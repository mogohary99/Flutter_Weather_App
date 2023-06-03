import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}

extension MediaQueryExtension on BuildContext {
  Size get size => mediaQuery.size;

  double height(double value) => mediaQuery.size.height * value;

  double width(double value) => mediaQuery.size.width * value;

  double get statusBarHeight=> mediaQuery.padding.top;
  // Get the proportionate height as per screen size
  // 896 is the layout height that designer use
  double percentageHeight(double inputHeight) =>
      (inputHeight / 896.0) * height(1);

  double percentageWidth(double inputWidth) => (inputWidth / 414.0) * width(1);
}


/// Double Extensions
extension Space on double {
  SizedBox h(BuildContext context) => SizedBox(
    height: context.percentageHeight(this),
  );
  SizedBox w(BuildContext context) => SizedBox(
    width: context.percentageWidth(this),
  );

  double pH(BuildContext context)=> context.percentageHeight(this);
  double pW(BuildContext context)=> context.percentageWidth(this);
}


/////////////////////////
extension TextThemeExtension on BuildContext {
  TextStyle? get displayLarge => textTheme.displayLarge;

  TextStyle? get displayMedium => textTheme.displayMedium;

  TextStyle? get displaySmall => textTheme.displaySmall;

  TextStyle? get headlineLarge => textTheme.headlineLarge;

  TextStyle? get headlineMedium => textTheme.headlineMedium;

  TextStyle? get headlineSmall => textTheme.headlineSmall;

  TextStyle? get titleLarge => textTheme.titleLarge;

  TextStyle? get titleMedium => textTheme.titleMedium;

  TextStyle? get titleSmall => textTheme.titleSmall;

  TextStyle? get bodyLarge => textTheme.bodyLarge;

  TextStyle? get bodyMedium => textTheme.bodyMedium;

  TextStyle? get bodySmall => textTheme.bodySmall;

  TextStyle? get labelLarge => textTheme.labelLarge;

  TextStyle? get labelSmall => textTheme.labelSmall;
}
