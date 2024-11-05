import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Future<Database> initializeDb() async {
    // Obtiene el path de la base de datos (sin usar path_provider, ya que está restringido).
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'jugadores_v2.db');

    // Abre la base de datos.
    return await openDatabase(path, version: 1);
  }
}
