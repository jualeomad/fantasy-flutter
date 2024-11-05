import 'package:sqflite/sqflite.dart';

class Player {
  final String name;
  final String imageUrl;
  final String position;
  final int rating;
  final String team;

  Player(
      {required this.name,
      required this.imageUrl,
      required this.rating,
      required this.position,
      required this.team});

  // Método para crear un objeto Player desde un Map.
  factory Player.fromMap(Map<String, dynamic> map) {
    return Player(
        name: map['NOMBRE'],
        imageUrl: map['FOTO'],
        position: map['POSICION'],
        rating: map['PUNTOS'],
        team: map['EQUIPO']);
  }
}

class PlayerDatabase {
  final Database db;

  PlayerDatabase(this.db);

  // Método para obtener una lista de jugadores con límite de 10
  Future<List<Player>> getPlayers() async {
    final List<Map<String, dynamic>> maps = await db.query(
      'jugadores',
    );

    await Future.delayed(const Duration(milliseconds: 500));

    // Crea un mapa para agrupar jugadores por equipo
    final Map<String, List<Player>> playersByTeam = {};

    for (var map in maps) {
      final player = Player.fromMap(map);
      final team = player.team;

      if (!playersByTeam.containsKey(team)) {
        playersByTeam[team] = [];
      }

      // Solo añade el jugador si el equipo tiene menos de 2 jugadores
      if (playersByTeam[team]!.length < 2) {
        playersByTeam[team]!.add(player);
      }
    }

    // Combina todas las listas en una sola lista de jugadores
    final List<Player> limitedPlayers =
        playersByTeam.values.expand((x) => x).toList();

    return limitedPlayers;
  }
}
