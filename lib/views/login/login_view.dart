import 'package:dsw59547/services/shared_prefs_service.dart';
import 'package:dsw59547/utils/app_colors.dart';
import 'package:dsw59547/utils/app_images.dart';
import 'package:dsw59547/utils/app_styles.dart';
import 'package:dsw59547/utils/app_texts.dart';
import 'package:dsw59547/views/home/home_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false; // Domyślnie hasło jest ukryte

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 62),
                    Image.asset(AppImages.logo),
                    const SizedBox(height: 21),
                    _signInText,
                    const SizedBox(height: 46),

                    // Pole do wpisywania email
                    TextFormField(
                      controller: _emailController,
                      // Walidacja danych
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !value.contains('@')) {
                          return 'Invalid email';
                        }
                        return null; // Brak błędu
                      },

                      decoration: InputDecoration(
                        hintText: 'Email or User Name',
                        // Użycie wspólnego stylu
                        hintStyle: AppStyles.hintTextStyle,
                        filled: true,
                        fillColor: AppColors.white,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Image.asset(
                            AppImages.user,
                            width: 20,
                            height: 20,
                          ),
                        ),
                        // Użycie wspólnej metody ramki z pliku AppStyles
                        enabledBorder: AppStyles.inputBorderStyle(
                          AppColors.lightPurple,
                        ),
                        focusedBorder: AppStyles.inputBorderStyle(
                          AppColors.purple,
                        ),
                        errorBorder: AppStyles.inputBorderStyle(Colors.red),
                        focusedErrorBorder: AppStyles.inputBorderStyle(
                          Colors.red,
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

                    // Pole do wpisywania hasła
                    TextFormField(
                      controller: _passwordController,
                      // Użyto zmiennej do ukrywania i wyświetlania hasła
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: AppStyles.hintTextStyle,
                        filled: true,
                        fillColor: AppColors.white,
                        // Ikona kłódki z assetów
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Image.asset(
                            AppImages.password,
                            width: 20,
                            height: 20,
                          ),
                        ),
                        // Ikona oka po prawej stronie z funkcją klikania
                        suffixIcon: GestureDetector(
                          onTap: () {
                            // Zmieniamy stan na przeciwny i odświeżamy widok
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Image.asset(
                              AppImages.eye,
                              width: 20,
                              height: 20,
                              // Zmiana koloru ikony gdy hasło jest widoczne
                              color: _isPasswordVisible
                                  ? AppColors.purple
                                  : Colors.grey,
                            ),
                          ),
                        ),
                        // Użycie wspólnej metody ramki z pliku AppStyles
                        enabledBorder: AppStyles.inputBorderStyle(
                          AppColors.lightPurple,
                        ),
                        focusedBorder: AppStyles.inputBorderStyle(
                          AppColors.purple,
                        ),
                        errorBorder: AppStyles.inputBorderStyle(Colors.red),
                        focusedErrorBorder: AppStyles.inputBorderStyle(
                          Colors.red,
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          print("Kliknięto Forget Password");
                        },
                        child: const Text(
                          'Forget Password?',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: AppColors.purple,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

                    // Przycisk logowania i jego funkcje
                    SizedBox(
                      // Rozciąga przycisk od lewej do prawej (z uwzględnieniem Paddingu 20px w Form)
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.buttonPurple,
                          foregroundColor: AppColors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () async {
                          // Wywołanie walidacji formularza za pomocą klucza
                          if (_formKey.currentState!.validate()) {
                            // Sprawdzanie czy dane są zgodne z tymi przypisami
                            if (_emailController.text == 'test@dsw.pl' &&
                                _passwordController.text == '12345') {
                              //Jeżeli tak, to przejście do Home
                              // Zapisanie sesji przed przejściem dalej
                              await SharedPrefsService.setLoggedIn(true);
                              if (!mounted) return;
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeView(),
                                ),
                              );
                            } else {
                              // Jeżeli nie, to wyświetlenie komunikatu na dole
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Błędny email lub hasło!'),
                                ),
                              );
                            }
                          }
                        },
                        child: const Text(
                          'Sign in',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget get _signInText {
  return const Align(
    alignment: AlignmentGeometry.topLeft,
    child: Text(
      AppTexts.signIn,
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w700,
        color: AppColors.purple,
      ),
    ),
  );
}
