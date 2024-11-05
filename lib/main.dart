import 'package:fantasy_flutter/db/players.dart';
import 'package:fantasy_flutter/screens/team_screen.dart';
import 'package:fantasy_flutter/ui/theme.dart';
import 'package:flutter/material.dart';

void main() async {
  // Para evitar errores al abrir la DB
  WidgetsFlutterBinding.ensureInitialized();
  debugPrint("TODO INICIALIZADO");
  await initializeApp();
}

Future<void> initializeApp() async {
  debugPrint("TODO INICIALIZADO");

  await copyDatabase();
  debugPrint((await getTables()).toString());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Namer App',
      theme: themeData, // ui/theme.dart
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
            appBar: AppBar(
              title: const Text("ProManager"),
              centerTitle: true,
              bottom: const TabBar(
                dividerHeight:
                    0, // Linea separadora de la tab de navegación de la screen
                tabs: [
                  Tab(
                    icon: Icon(Icons.home_outlined),
                    text: "INICIO",
                  ),
                  Tab(icon: Icon(Icons.chat_outlined), text: "CHATS"),
                  Tab(icon: Icon(Icons.sports_soccer_outlined), text: "EQUIPO"),
                  Tab(
                      icon: Icon(Icons.currency_exchange_outlined),
                      text: "MERCADO"),
                  Tab(
                    icon: Icon(Icons.emoji_events_outlined),
                    text: "TABLA",
                  ),
                ],
              ),
            ),
            body: const TabBarView(children: [
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
              TeamScreen(),
              Icon(Icons.directions_bike),
              Icon(Icons.directions_bike),
            ])),
      ),
    );
  }
}
