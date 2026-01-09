class Note {
  final int? id; // ID automatyczne
  final String title; // Tytuł notatki
  final String content; // Treść notatki

  Note({this.id, required this.title, required this.content});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
    };
  }
}