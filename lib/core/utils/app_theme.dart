import 'package:flutter/material.dart';
import 'package:pokedex/core/utils/app_colors.dart';

class AppTheme {
  final theme = ThemeData(

    tabBarTheme: const TabBarTheme(
      labelColor: AppColors.primaryText,
      unselectedLabelColor: AppColors.secondaryText,
      labelPadding: EdgeInsets.all(0),
      labelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: AppColors.primary),
      unselectedLabelStyle: TextStyle(
        fontSize: 14,
      ),
    ),

    inputDecorationTheme: const InputDecorationTheme (
      iconColor: AppColors.primary,
      hintStyle: TextStyle(fontSize: 12, color: AppColors.secondaryText),
      labelStyle: TextStyle(fontSize: 12, color: AppColors.secondaryText),
      fillColor: AppColors.white,
      isDense: true,
      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      errorStyle: TextStyle(fontSize: 10),
    ),

    fontFamily: '.SF UI Display',
  
    textTheme: const TextTheme(
      subtitle1: TextStyle(color: AppColors.primaryText, fontSize: 13.2),
      bodyText2: TextStyle(color: AppColors.primaryText)
    ),
  
    backgroundColor: AppColors.white,
    
    scaffoldBackgroundColor: AppColors.white,

    appBarTheme:  const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: AppColors.primary ,
      iconTheme:  IconThemeData(color: AppColors.white),
      titleTextStyle: TextStyle(
          fontSize: 24,
          color: AppColors.white,
          fontWeight: FontWeight.w700,
      )
    )
  );
}