import 'dart:convert';
import 'dart:math';
import 'package:fantasy_flutter/ui/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Player {
  final String name;
  final String apodo;
  final String imageUrl;
  final String position;
  final int rating;
  final String team;

  Player({
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.position,
    required this.team,
  }) : apodo = _generarApodo(name);

  static String _generarApodo(String name) {
    List<String> split = name.split(" ");
    // Verificamos si hay al menos dos partes en el nombre
    if (split.length > 1) {
      return split[1]; // Retorna el apellido o segunda parte del nombre
    } else {
      return split[0]; // Retorna el nombre completo si solo hay una palabra
    }
  }

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

      // Parse JSON data into Player objects
      final List<Player> allPlayers =
          jsonData.map((playerJson) => Player.fromJson(playerJson)).toList();

      // Randomly select up to 30 players
      final random = Random();
      final List<Player> randomPlayers = [];

      // Shuffle and take 30 unique players or fewer if the list has less than 30
      while (randomPlayers.length < 30 && allPlayers.isNotEmpty) {
        final index = random.nextInt(allPlayers.length);
        randomPlayers.add(allPlayers.removeAt(index));
      }

      return randomPlayers;
    } else {
      // Handle HTTP error
      throw Exception('Failed to load players');
    }
  }
}
