import 'package:dsw59547/utils/app_images.dart';
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
