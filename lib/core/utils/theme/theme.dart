import 'package:flutter/material.dart';
import 'package:flutter_weather_app/core/utils/theme/app_colors.dart';

ThemeData get appTheme => ThemeData(
      scaffoldBackgroundColor: AppColors.primaryColor,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primaryColor,
        secondary: AppColors.primaryLight,
        onPrimary: AppColors.white,
        onSecondary: AppColors.whiteGrey,
      ),
      textTheme: _textTheme,
    );

TextTheme get _textTheme => const TextTheme(
    displayLarge: TextStyle(
      color: AppColors.white,
      fontSize: 70,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
    titleSmall: TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: TextStyle(
      color: AppColors.primaryLight,
      fontSize: 16,
    ));
