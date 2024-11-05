import 'package:fantasy_flutter/db/database_helper.dart';
import 'package:fantasy_flutter/models/player.dart';
import 'package:flutter/material.dart';

class TeamProvider with ChangeNotifier {
  List<List<Player>> _listaDeListas = [];
  List<List<Player>> get listaDeListas => _listaDeListas;

  List<Player> _myPlayers = [];
  List<Player> get myPlayers => _myPlayers;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isDisposed = false;

  @override
  void dispose() {
    _isDisposed = true; // Set the flag to true when disposed
    super.dispose();
  }

  // == CONSTRUCTOR == //
  TeamProvider() {
    final fp = Player(
        name: "Valverde",
        imageUrl:
            "https://media.futbolfantasy.com/thumb/400x400/v202410181304/uploads/images/jugadores/ficha/3758.png",
        rating: 86,
        team: "Real madrid",
        position: "DEL");
    final List<int> longitudes = [1, 4, 4, 2];
    _listaDeListas = longitudes
        .map((longitud) => List<Player>.filled(longitud, fp))
        .toList();

    fetchPlayers();
  }

  void agregarLista(List<Player> nuevaLista) {
    _listaDeListas.add(nuevaLista);
    notifyListeners();
  }

  void eliminarLista(int index) {
    if (index >= 0 && index < _listaDeListas.length) {
      _listaDeListas.removeAt(index);
      notifyListeners(); // Notifica a los oyentes que hubo un cambio
    }
  }

  void modificarElementoEnLista(
      int listaIndex, int elementoIndex, Player nuevoValor) {
    final fp2 = Player(
        name: "Vinicius Junior",
        imageUrl:
            "https://media.futbolfantasy.com/thumb/400x400/v202410161303/uploads/images/jugadores/ficha/5565.png",
        rating: 18,
        team: "Real madrid",
        position: "DEL");

    _listaDeListas[listaIndex][elementoIndex] = nuevoValor;
    notifyListeners();
  }

  Future<void> fetchPlayers() async {
    final db = await DatabaseHelper.initializeDb();
    final playerDatabase = PlayerDatabase(db);

    _isLoading = true;
    if (!_isDisposed) notifyListeners(); // Notify only if not disposed

    _myPlayers = await playerDatabase.getPlayers();

    _isLoading = false;
    if (!_isDisposed) notifyListeners(); // Notify only if not disposed
  }
}
