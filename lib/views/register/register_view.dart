import 'package:dsw59547/services/shared_prefs_service.dart';
import 'package:dsw59547/views/login/login_view.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Resetowanie statusu w pamięci telefonu
            await SharedPrefsService.setLoggedIn(false);

            // Powrót do ekranu logowania i czyszczenie historii nawigacji
            if (!context.mounted) return;
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginView()),
              (Route<dynamic> route) => false,
            );
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
