import 'package:fantasy_flutter/components/team_bottom_tabs.dart';
import 'package:fantasy_flutter/components/team_grid.dart';
import 'package:fantasy_flutter/providers/team_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => TeamProvider()
          ..fetchPlayers(), // Carga jugadores al crear el proveedor
        child: Consumer<TeamProvider>(
          builder: (context, teamProvider, child) {
            if (teamProvider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return SizedBox.expand(
              child: Column(
                children: [
                  Expanded(
                    flex: 8,
                    child: TeamGrid(), // Aquí se pasa el contenido a TeamGrid
                  ),
                  Expanded(flex: 2, child: TeamBottomTabs())
                ],
              ),
            );
          },
        ));
  }
}
