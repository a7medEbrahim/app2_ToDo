import 'package:flutter/material.dart';
import 'package:todo/shared/stayles/colors.dart';

class MyThemeData {
  static ThemeData lightMood = ThemeData(
      scaffoldBackgroundColor: mintGreen,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey));
}
