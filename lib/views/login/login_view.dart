import 'package:dsw59547/utils/app_colors.dart';
import 'package:dsw59547/utils/app_images.dart';
import 'package:dsw59547/utils/app_texts.dart';
import 'package:flutter/material.dart';

import '../register/register_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 62),
              Image.asset(AppImages.logo),
              SizedBox(height: 21),
              _signInText,
              ElevatedButton(
                child: const Text('Open route'),
                onPressed: () {
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