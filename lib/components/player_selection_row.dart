import 'package:fantasy_flutter/models/player.dart';
import 'package:flutter/material.dart';

class PlayerSelectionRow extends StatelessWidget {
  final Player player;

  PlayerSelectionRow({required this.player});

  final double height = 80;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Container(height: height,decoration: BoxDecoration(color: Colors.white))),
        Expanded(
            flex: 3,
            child: Container(height: height,decoration: BoxDecoration(color: Colors.yellow)))
      ],
    );
  }
}
