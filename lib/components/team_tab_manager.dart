// TeamGrid.dart

import 'package:fantasy_flutter/components/team_grid.dart';
import 'package:flutter/material.dart';

class TeamTabManager extends StatelessWidget {
  final String selectedTab;

  const TeamTabManager({Key? key, required this.selectedTab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget content;

    switch (selectedTab) {
      case "ALINEACIÓN":
        content = TeamGrid();
        break;
      case "PLANTILLA":
        content = Center(
            child: Text("PLANTILLA", style: TextStyle(color: Colors.white)));
        break;
      case "PUNTOS":
        content = Center(
            child: Text("PUNTOS", style: TextStyle(color: Colors.white)));
        break;
      default:
        content = Center(child: Text("Seleccione una pestaña"));
    }

    return content;
  }
}
