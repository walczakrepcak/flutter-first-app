import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Twoje notatki"),
        backgroundColor: Colors.deepPurple, // DOSTOSOWAĆ KOLOR DO APLIKACJI
      ),
      body: const Center(
        child: Text("Tutaj pojawi się lista z bazy danych"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Tutaj dodamy funkcję otwierającą okno dodawania notatek
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
