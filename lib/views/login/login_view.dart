import 'package:dsw59547/utils/app_colors.dart';
import 'package:dsw59547/utils/app_images.dart';
import 'package:dsw59547/utils/app_texts.dart';
import 'package:dsw59547/views/widgets/basic_text_form_field.dart';
import 'package:flutter/material.dart';

import '../register/register_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: 62),
                  Image.asset(AppImages.logo),
                  SizedBox(height: 21),
                  _signInText,
                  SizedBox(height: 46),
                  BasicTextFormField(initialValue: 'email',),
                  SizedBox(height: 40),
                  BasicTextFormField(initialValue: '12345'),
                  ElevatedButton(
                    child: const Text('Sign in'),
                    onPressed: () { // dodać walidację
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (context) => const RegisterView(),
                        ),
                      );
                    },
                  ),
                ],
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