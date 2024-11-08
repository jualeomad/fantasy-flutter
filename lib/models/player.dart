import 'dart:convert';
import 'package:fantasy_flutter/ui/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      name: json['NOMBRE'] as String,
      imageUrl: json['FOTO'] as String,
      position: json['POSICION'] as String,
      rating: json['PUNTOS'] as int,
      team: json['EQUIPO'] as String,
    );
  }

  static String parsePositionForSelectionScreen(String position) {
    switch (position) {
      case 'DEF':
        return 'DF';
      case 'MED':
        return 'MC';
      case 'DEL':
        return 'DL';
      case 'POR':
        return 'PT';
      default:
        return position; // Si no coincide, devuelve la posición original
    }
  }

  static Color getBgColorByPosition(String position) {
   switch (position) {
      case 'DEF':
        return CustomColors.dfBackground;
      case 'MED':
        return CustomColors.mcBackground;
      case 'DEL':
        return CustomColors.dlBackground;
      case 'POR':
        return CustomColors.ptBackground;
      default:
        return Colors.white; // Si no coincide, devuelve la posición original
    }
  }
}

class PlayerRepository {
  final String apiUrl;

  PlayerRepository(this.apiUrl);

  // Method to fetch players from the HTTP API, limited to two players per team
  Future<List<Player>> getPlayers() async {
    final url = Uri.parse(apiUrl);

    // Send a GET request to fetch players
    final response = await http.get(url);

    debugPrint("PETICION HECHA");

    if (response.statusCode == 200) {
      // Decode the JSON response
      final List<dynamic> jsonData = json.decode(response.body);

      // Create a map to group players by team
      final Map<String, List<Player>> playersByTeam = {};

      for (var playerJson in jsonData) {
        final player = Player.fromJson(playerJson);
        final team = player.team;

        // Initialize the team list if it doesn't exist
        if (!playersByTeam.containsKey(team)) {
          playersByTeam[team] = [];
        }

        // Add player to team list if there are less than 2 players for that team
        if (playersByTeam[team]!.length < 2) {
          playersByTeam[team]!.add(player);
        }
      }

      // Combine all players into a single list, limited to 2 per team
      final List<Player> limitedPlayers =
          playersByTeam.values.expand((x) => x).toList();

      return limitedPlayers;
    } else {
      // Handle HTTP error
      throw Exception('Failed to load players');
    }
  }
}
