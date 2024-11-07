import 'package:fantasy_flutter/components/player_selection_row.dart';
import 'package:fantasy_flutter/ui/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:fantasy_flutter/models/player.dart';

class PlayerSelectionScreen extends StatelessWidget {
  final List<Player> players;
  final Function onSelect;

  PlayerSelectionScreen({required this.players, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.playerSelectionBg,
      appBar: AppBar(
        title: Text('Seleccionar Jugador'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: players.length,
          itemBuilder: (context, index) {
            final Player player = players[index];

            debugPrint("SELECCIONABLES: ${players.length}");

            return Column(children: [
              GestureDetector(
                onTap: () {
                  onSelect(player);
                  Navigator.of(context).pop();
                },
                child: PlayerSelectionRow(player: player),
              ),
              SizedBox(height: 20)
            ]);
          },
        ),
      ),
    );
  }
}
