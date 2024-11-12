import 'package:fantasy_flutter/providers/navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/liga_screen.dart';
import '../screens/main_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menú de Navegación',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          // Ítem para "Mis ligas"
          ListTile(
            leading: Icon(Icons.emoji_events),
            title: Text('Mis ligas'),
            tileColor: navigationProvider.currentScreen == 'MainScreen' ? Colors.blue[100] : null,
            onTap: () {
              navigationProvider.setCurrentScreen('MainScreen'); // Actualiza el estado
              Navigator.pop(context); // Cierra el Drawer
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MainScreen()), // Navega a MainScreen
              );
            },
          ),
          // Ítem para "Mi liga (para desarrollo)"
          ListTile(
            leading: Icon(Icons.emoji_events),
            title: Text('Mi liga (para desarrollo)'),
            tileColor: navigationProvider.currentScreen == 'LigaScreen' ? Colors.blue[100] : null,
            onTap: () {
              navigationProvider.setCurrentScreen('LigaScreen'); // Actualiza el estado
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LigaScreen()), // Navega a LigaScreen
              );
            },
          ),
        ],
      ),
    );
  }
}

