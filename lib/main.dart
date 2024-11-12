import 'package:fantasy_flutter/providers/navigation_provider.dart';
import 'package:fantasy_flutter/screens/liga_screen.dart';
import 'package:fantasy_flutter/screens/main_screen.dart';
import 'package:fantasy_flutter/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  // Para evitar errores al abrir la DB
  WidgetsFlutterBinding.ensureInitialized();
  debugPrint("TODO INICIALIZADO");
  await initializeApp();
}

Future<void> initializeApp() async {
  debugPrint("TODO INICIALIZADO");

  // await copyDatabase();
  // debugPrint((await getTables()).toString());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NavigationProvider(),
      child: MaterialApp(
        title: 'App con Drawer',
        theme: themeData,
        home: LigaScreen(),
      ),
    );
  }
}
