import 'package:flutter/material.dart';
import 'package:dsw59547/utils/app_colors.dart';

class AppStyles {
  // Nagłówek (np. Sign in, Sign up) - Font: Inter, Bold (700), 30px
  static const TextStyle titleStyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 30,
    fontWeight: FontWeight.w700,
    color: AppColors.purple,
  );

  // Styl dla podpowiedzi (Hint Text) - Font: Inter, Regular (400), 15px, 30%
  static TextStyle hintTextStyle = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    fontSize: 15,
    color: AppColors.purple.withOpacity(0.3),
  );

  // Styl tekstu wewnątrz przycisków biały - Font: Inter, Bold (700), 15px
  static const TextStyle buttonTextStyleWH = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
    fontSize: 15,
    color: AppColors.white,
  );

  // Styl tekstu wewnątrz przycisków fiolet- Font: Inter, Bold (700), 15px
  static const TextStyle buttonTextStylePP = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
    fontSize: 15,
    color: AppColors.purple,
  );

  // Styl napisu Back - Font: Inter, Regular (400), 12px
  static const TextStyle backTextStyle = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: AppColors.purple,
  );

  // Styl tekstu "Don't have account?" - Font: Inter, Regular (400), 15px
  static const TextStyle smallTextStyle = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    fontSize: 15,
    color: AppColors.purple,
  );

  // Metoda do generowania ramek
  static OutlineInputBorder inputBorderStyle(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: color),
    );
  }
}
