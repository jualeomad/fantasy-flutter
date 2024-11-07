import 'package:fantasy_flutter/components/player_card.dart';
import 'package:fantasy_flutter/models/player.dart';
import 'package:fantasy_flutter/screens/player_selection_screen.dart';
import 'package:flutter/material.dart';

class DropdownComponent extends StatelessWidget {
  final List<Player> options;
  final Function onSelect;
  final Widget child;

  DropdownComponent({
    required this.options,
    required this.onSelect,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navegar a la nueva pantalla de selección de jugadores
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlayerSelectionScreen(
              players: options,
              onSelect: onSelect,
            ),
          ),
        );
      },
      child: child,
    );
  }
}
