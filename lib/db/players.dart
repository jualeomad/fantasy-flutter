import 'package:fantasy_flutter/models/player.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> copyDatabase() async {
  var databasesPath = await getDatabasesPath();
  var path = join(databasesPath, "jugadores_v2.db");

  // Asegurarse de que el directorio principal exista
  try {
    await Directory(dirname(path)).create(recursive: true);
    print("copyDatabase => Directorio creado: ${dirname(path)}");
  } catch (e) {
    print("copyDatabase => Error al crear el directorio: $e");
  }

  // Verifica si la base de datos ya existe y la elimina si es así
  if (await File(path).exists()) {
    try {
      await File(path).delete();
      print("copyDatabase => Base de datos existente eliminada en $path");
    } catch (e) {
      print("copyDatabase => Error al eliminar la base de datos existente: $e");
    }
  }

  // Copiar desde los assets
  try {
    ByteData data = await rootBundle.load('assets/jugadores_v2.db');
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    // Escribir y hacer flush de los bytes escritos
    await File(path).writeAsBytes(bytes, flush: true);
    print("copyDatabase => Base de datos copiada correctamente en $path");

    // Verifica el tamaño del archivo después de la copia
    var file = File(path);
    var fileSize = await file.length();
    print("copyDatabase => Tamaño del archivo copiado: $fileSize bytes");

    // Verifica si el archivo de la base de datos existe después de escribirlo
    if (await file.exists()) {
      print(
          "copyDatabase => La base de datos se ha copiado correctamente y existe en $path");
    } else {
      print(
          "copyDatabase => La base de datos NO se ha copiado correctamente o no existe en $path");
    }
  } catch (e) {
    print("copyDatabase => Error al copiar la base de datos desde assets: $e");
  }
}

// Future<List<Map<String, dynamic>>> getPlayers() async {
//   var dbDir = await getDatabasesPath();
//   var dbPath = join(dbDir, "jugadores_v2.db");
//   final Database db = await openDatabase(dbPath);
//   return await db
//       .query('jugadores'); // Selecciona todos los registros de la tabla 'users'
// }


Future<List<Player>> getPlayers() async {
  final url = Uri.parse('http://localhost:3000/jugadores');

  // Send a GET request to the specified URL
  final response = await http.get(url);

  // Check if the request was successful
  if (response.statusCode == 200) {
    // Decode the JSON response
    final List<dynamic> jsonData = json.decode(response.body);

    // Convert each entry to a Player object using the fromJson factory
    return jsonData.map((json) => Player.fromJson(json)).toList();
  } else {
    // Handle the error
    throw Exception('Failed to load players');
  }
}

Future<List<Map<String, Object?>>> getTables() async {
  var dbDir = await getDatabasesPath();
  var dbPath = join(dbDir, "jugadores_v2.db");
  final Database db = await openDatabase(dbPath);
  return db.rawQuery("""
SELECT name FROM sqlite_master WHERE type='table';
""");
}
