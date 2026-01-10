import 'package:dsw59547/services/shared_prefs_service.dart';
import 'package:dsw59547/utils/app_colors.dart';
import 'package:dsw59547/utils/app_images.dart';
import 'package:dsw59547/utils/app_texts.dart';
import 'package:dsw59547/views/widgets/basic_text_form_field.dart';
import 'package:flutter/material.dart';

import 'package:dsw59547/views/home/home_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
                    SizedBox(height: 62),
                    Image.asset(AppImages.logo),
                    SizedBox(height: 21),
                    _signInText,
                    SizedBox(height: 46),

                    // Pole do wpisywania email
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(hintText: 'Email'),
                      // Walidacja danych
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !value.contains('@')) {
                          return 'Invalid email';
                        }
                        return null; // Brak błędu
                      },
                    ),

                    SizedBox(height: 40),

                    // Pole do wpisywania hasla
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(hintText: 'Password'),
                    ),

                    // Przycisk logowania i jego funkcje
                    ElevatedButton(
                      child: const Text('Sign in'),
                      onPressed: () async {
                        // Wywolanie walidacji formularza za pomoca klucza
                        if (_formKey.currentState!.validate()) {
                          // Sprawdzenie czy dane są zgodne z tymi przypisanymi
                          if (_emailController.text == 'test@dsw.pl' &&
                              _passwordController.text == '12345') {
                            // Jeżeli tak, to przejscie do Home (tymczasowo RegisterView)
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
                            // Jeżeli nie, to wyswietlenie komunikatu na dole
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Błędny email lub hasło!'),
                              ),
                            );
                          }
                        }
                      },
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
  return Align(
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
