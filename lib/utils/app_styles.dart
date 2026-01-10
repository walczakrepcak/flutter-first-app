import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppStyles {
  // Wspólny styl dla podpowiedzi (Hint Text)
  static TextStyle hintTextStyle = TextStyle(
    fontFamily: 'Inter',      // Czcionka Inter
    fontWeight: FontWeight.w400, // Weight: 400 (Regular)
    fontSize: 15,             // Size: 15px
    color: AppColors.purple.withOpacity(0.3), // Color: 30%
  );

  // Metoda do generowania ramek
  static OutlineInputBorder inputBorderStyle(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: AppColors.lightPurple),
    );
  }
}
