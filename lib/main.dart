import 'package:dsw59547/services/shared_prefs_service.dart';
import 'package:dsw59547/views/login/login_view.dart';
import 'package:dsw59547/views/register/register_view.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  //Sprawdzenie czy użytkownik jest już zalogowany
  bool loggedIn = await SharedPrefsService.isLoggedIn();


  runApp(
    const MaterialApp(
      title: 'Navigation Basics',
      debugShowCheckedModeBanner: false,
      // Jeżeli zalogowany, idź do Home (Register), jeśli nie, to idź do Login
      home: loggedIn ? const RegisterView(): const LoginView(),
    ),
  );
}




