import 'package:dsw59547/models/note_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static Database? _database;

  // Pobieranie bazy danych, jeżeli baze nie istnieje, program inicjalizuje ją
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Inicjalizacja bazy danych na urządzeniu
  Future<Database> _initDatabase() async {
    // Określenie ścieżki do pliku bazy danych na telefonie
    String path = join(await getDatabasesPath(), 'notes_database.db');

    // Otwarcie bazy (tworzy plik, jeśli go nie ma)
    return await openDatabase(
      path,
      version: 1, // Wersja bazy danych
      onCreate: (db, version) {
        // Wykonanie polecenia SQL tworzącego tabelę przy pierwszym uruchomieniu
        // id ustawione jako PRIMARY KEY AUTOINCREMENT - baza sama nadaje numery
        return db.execute(
          'CREATE TABLE notes(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT)',
        );
      },
    );
  }

  // Dodawanie nowej notatki do tabeli
  Future<void> insertNote(Note note) async {
    final db = await database;
    // Zamiana obiektu Note na Mapę i zapis do bazy
    await db.insert(
      'notes',
      note.toMap(),
      conflictAlgorithm:
          ConflictAlgorithm.replace, // W razie konfliktu zastępuje dane
    );
  }

  // Pobieranie wszystkich notatek z tabeli
  Future<List<Note>> getNotes() async {
    final db = await database;
    // Pobranie danych w formie Listy Map (surowe dane z SQL)
    final List<Map<String, dynamic>> maps = await db.query('notes');

    // Zamiana surowych danych na listę obiektów Note (użycie rzutowania 'as')
    return List.generate(maps.length, (i) {
      return Note(
        id: maps[i]['id'] as int?,
        title: maps[i]['title'] as String,
        content: maps[i]['content'] as String,
      );
    });
  }

  // Opcja usuwania notatek
  Future<void> deleteNote(int id) async {
    final db = await database;
    await db.delete(
      'notes',
      where: 'id = ?', // Usuwamy notatkę o konkretnym ID
      whereArgs: [id],
    );
  }

  // Funkcja aktualizująca istniejącą notatkę w bazie danych
  Future<void> updateNote(Note note) async {
    final db = await database; // Pobieranie instancji bazy danych

    // Wykonanie aktualizacji w tabeli 'notes'
    await db.update(
      'notes',
      note.toMap(), // Przekazanie nowych danych w formie Mapy
      where: 'id = ?', // Warunek: znajdź notatkę o konkretnym ID
      whereArgs: [note.id],
    );
  }
}
