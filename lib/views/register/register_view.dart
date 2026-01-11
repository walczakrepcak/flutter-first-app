import 'package:dsw59547/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:dsw59547/utils/app_colors.dart';
import 'package:dsw59547/utils/app_styles.dart';
import 'package:dsw59547/utils/app_texts.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Odstęp od samej góry
                const SizedBox(height: 60),

                // Przycisk Back (ikona i napis razem)
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context); // Powrót do logowania
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min, // Teraz GestureDetector nie zajmuje całego wiersza
                    children: [
                      Image.asset(AppImages.back, width: 16, height: 16), // Ikona back
                      const SizedBox(width: 5), // Mały odstęp/spacja
                      const Text(
                        "Back",
                        style: AppStyles.backTextStyle,
                      ),
                    ],
                  ),
                ),

                // Odstęp do napisu Sign Up
                const SizedBox(height: 104),

                // Nagłówek
                const Text(
                  "Sign Up",
                  style: AppStyles.titleStyle,
                ),

                const SizedBox(height: 46), // Odstęp od nagłówka

                // Full Name
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Full Name',
                    hintStyle: AppStyles.hintTextStyle,
                    filled: true,
                    fillColor: AppColors.white,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Image.asset(AppImages.user, width: 20, height: 20),
                    ),
                    enabledBorder: AppStyles.inputBorderStyle(AppColors.lightPurple),
                    focusedBorder: AppStyles.inputBorderStyle(AppColors.purple),
                  ),
                ),

                const SizedBox(height: 40),

                // Email
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: AppStyles.hintTextStyle,
                    filled: true,
                    fillColor: AppColors.white,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Image.asset(AppImages.email, width: 20, height: 20),
                    ),
                    enabledBorder: AppStyles.inputBorderStyle(AppColors.lightPurple),
                    focusedBorder: AppStyles.inputBorderStyle(AppColors.purple),
                  ),
                ),

                const SizedBox(height: 40),

                // Password
                TextFormField(
                  obscureText: true, // Pamiętaj o dodaniu logiki widoczności później
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: AppStyles.hintTextStyle,
                    filled: true,
                    fillColor: AppColors.white,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Image.asset(AppImages.password, width: 20, height: 20),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Image.asset(AppImages.eye, width: 20, height: 20),
                    ),
                    enabledBorder: AppStyles.inputBorderStyle(AppColors.lightPurple),
                    focusedBorder: AppStyles.inputBorderStyle(AppColors.purple),
                  ),
                ),

                const SizedBox(height: 40),

                // Confirm Password
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    hintStyle: AppStyles.hintTextStyle,
                    filled: true,
                    fillColor: AppColors.white,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Image.asset(AppImages.password, width: 20, height: 20),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Image.asset(AppImages.eye, width: 20, height: 20),
                    ),
                    enabledBorder: AppStyles.inputBorderStyle(AppColors.lightPurple),
                    focusedBorder: AppStyles.inputBorderStyle(AppColors.purple),
                  ),
                ),
                const SizedBox(height: 80), // Odstęp 80px od ostatniego pola

                // Przycisk Sign Up
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.purple,
                      foregroundColor: AppColors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      // Tu w przyszłości można dodać logikę rejestracji
                      print("Zarejestrowano użytkownika");
                    },
                    child: const Text(
                      'Sign Up',
                      style: AppStyles.buttonTextStyleWH,
                    ),
                  ),
                ),

                const SizedBox(height: 140), // Odstęp 140px w dół

                // Napis Already have an account? Sign In
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account? ",
                      style: AppStyles.smallTextStyle,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Skoro przyszliśmy z LoginView, Navigator.pop() nas tam zawróci
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Sign In",
                        style: AppStyles.buttonTextStylePP,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20), // Mały margines na samym dole, żeby nie dotykało krawędzi

                // Tutaj będziemy dodawać kolejne elementy...
              ],
            ),
          ),
        ),
      ),
    );
  }
}
