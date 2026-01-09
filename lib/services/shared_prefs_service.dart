import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  // Klucz pod którym zapisuje się informację
  static const String _isLoggedinKey = 'isLoggedin';

  //Funkcja zapisuje status zalogowania
  static Future<void> setLoggedIn(bool status) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isLoggedinKey, status);
  }

  // Funkcja sprawdzajaca czy użytkownik jest zalogowany
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedinKey) ?? false; // Jeżeli null, zwróć false
  }
}
