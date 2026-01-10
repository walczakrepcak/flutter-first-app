import 'package:dsw59547/models/note_model.dart';
import 'package:dsw59547/services/database_service.dart';
import 'package:dsw59547/services/shared_prefs_service.dart';
import 'package:dsw59547/utils/app_colors.dart';
import 'package:dsw59547/views/login/login_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final DatabaseService _dbService = DatabaseService();
  List<Note> _notes = []; // Lista przechowująca notatki pobrane z bazy

  @override
  void initState() {
    super.initState();
    _refreshNotes(); // Pobranie danych przy uruchomieniu ekranu
  }

  // Funkcja pobierająca dane z bazy i odświeżająca widok
  void _refreshNotes() async {
    final data = await _dbService.getNotes();
    setState(() {
      _notes =
          data; // Przypisanie danych i nakazanie Flutterowi przebudowania UI
    });
  }

  // Funkcja wyświetlająca okno dialogowe do wprowadzania nowej notatki
  void _showAddNoteDialog() {
    // Inicjalizacja kontrolerów do przechwytywania tekstu z pól tekstowych
    final titleController = TextEditingController();
    final contentController = TextEditingController();

    // Wyświetlenie systemowego okna dialogowego
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Nowa notatka"),
        // Zawartość okna ułożona w pionie
        content: Column(
          mainAxisSize: MainAxisSize.min,
          // Dopasowanie wysokości okna do zawartości
          children: [
            // Pole tekstowe dla tytułu
            TextField(
              controller: titleController,
              decoration: const InputDecoration(hintText: "Tytuł"),
            ),
            // Pole tekstowe dla treści
            TextField(
              controller: contentController,
              decoration: const InputDecoration(hintText: "Treść"),
            ),
          ],
        ),
        // Przyciski akcji na dole okna
        actions: [
          // Przycisk rezygnacji, zamyka okno bez zapisu
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Anuluj"),
          ),
          // Przycisk zapisu, przesyła dane do bazy danych
          ElevatedButton(
            onPressed: () async {
              // Sprawdzenie, czy tytuł nie jest pusty przed zapisem
              if (titleController.text.isNotEmpty) {
                // Tworzenie nowego obiektu notatki na podstawie wpisanych danych
                final newNote = Note(
                  title: titleController.text,
                  content: contentController.text,
                );

                // Wywołanie usługi bazy danych do trwałego zapisu notatki
                await _dbService.insertNote(newNote);

                // Wywołanie odświeżenia listy na głównym ekranie
                _refreshNotes();

                // Sprawdzenie, czy kontekst widżetu jest nadal poprawny
                if (!mounted) return;

                // Zamknięcie okna dialogowego po zakończeniu operacji
                Navigator.pop(context);
              }
            },
            child: const Text("Zapisz"),
          ),
        ],
      ),
    );
  }

  // Funkcja realizująca proces wylogowania użytkownika
  void _logout() async {
    // Zmiana statusu sesji w pamięci trwałej na "niezalogowany"
    await SharedPrefsService.setLoggedIn(false);

    // Sprawdzenie poprawności kontekstu przed wykonaniem nawigacji
    if (!mounted) return;

    // Przekierowanie do ekranu logowania przy jednoczesnym
    // wyczyszczeniu całej historii stosu nawigacji
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginView()),
      (Route<dynamic> route) => false, // Usunięcie wszystkich poprzednich tras
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Ustawienie koloru tła całej strony na biały
      backgroundColor: AppColors.white,
      appBar: AppBar(
        // Konfiguracja paska górnego z tytułem i stylizacją tekstu
        title: const Text(
          "Twoje notatki",
          style: TextStyle(
            color: AppColors.purple,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.white,
        elevation: 0,
        // Usunięcie cienia pod paskiem dla uzyskania płaskiego wyglądu
        actions: [
          // Przycisk wylogowania umieszczony w górnym rogu
          IconButton(
            icon: const Icon(Icons.logout, color: AppColors.purple),
            // Ikona z systemowej bazy Material Icons
            onPressed: _logout,
          ),
        ],
      ),
      // Główna zawartość ekranu, logika warunkowa wyświetlania danych
      body: _notes.isEmpty
          // Widok wyświetlany, gdy lista notatek pobrana z bazy SQLite jest pusta
          ? const Center(child: Text("Brak notatek. Kliknij +, aby dodać."))
          // Dynamiczne budowanie listy, gdy w bazie znajdują się dane
          : ListView.builder(
              itemCount: _notes.length, // Określenie liczby elementów na liście
              itemBuilder: (context, index) => ListTile(
                // Ikona notatki umieszczona na początku elementu listy
                leading: const Icon(Icons.note, color: AppColors.purple),

                // Wyświetlenie tytułu notatki z aktualnego indeksu listy
                title: Text(_notes[index].title),

                // Wyświetlenie treści notatki pod tytułem
                subtitle: Text(_notes[index].content),

                // Element końcowy (po prawej stronie) - przycisk do usuwania
                trailing: IconButton(
                  // Ikona kosza w kolorze czerwonym dla odróżnienia funkcji destrukcyjnej
                  icon: const Icon(Icons.delete, color: Colors.red),

                  // Akcja po naciśnięciu ikony kosza
                  onPressed: () async {
                    // Pobranie unikalnego identyfikatora ID notatki z bazy
                    final id = _notes[index].id;

                    // Sprawdzenie, czy ID nie jest puste (null) przed próbą usunięcia
                    if (id != null) {
                      // Wywołanie asynchronicznej metody usuwania z serwisu bazy danych
                      await _dbService.deleteNote(id);

                      // Ponowne pobranie danych z bazy, aby odświeżyć interfejs użytkownika
                      _refreshNotes();
                    }
                  },
                ),
              ),
            ),
      // Przycisk akcji wiszący nad zawartością
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.white,
        onPressed: _showAddNoteDialog,
        // Wywołanie zdefiniowanej wcześniej funkcji okna dialogowego
        child: const Icon(
          Icons.add, // Ikona plusa z systemowej bazy Material Icons
          color: AppColors.purple,
        ),
      ),
    );
  }
}
