import 'package:fantasy_flutter/components/full_screen_dropdown.dart';
import 'package:fantasy_flutter/components/player_card.dart';
import 'package:fantasy_flutter/models/player.dart';
import 'package:fantasy_flutter/providers/team_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TeamGrid extends StatelessWidget {
  final String formation;

  const TeamGrid({
    Key? key,
    this.formation = "442",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fp = Player(
      name: "Lamine Yamal",
      imageUrl:
          "https://media.futbolfantasy.com/thumb/400x400/v202410171202/uploads/images/jugadores/ficha/11520.png",
      rating: 117,
      team: "Barcelona",
      position: "DEL",
    );

    // Ancho y alto de la pantalla
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    int defs = int.parse(formation[0]);
    int mids = int.parse(formation[1]);
    int fws = int.parse(formation[2]);

    // Configuración de tamaño de tarjeta y separación de filas
    // double cardWidth =
    // screenWidth * 0.15; // Ajuste del tamaño para adaptarse mejor
    double cardHeight = screenHeight * 0.12;
    double rowSeparation = screenHeight * 0.03;

    return Consumer<TeamProvider>(
      builder: (context, provider, child) {
        return Stack(
          children: [
            // Imagen de fondo
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Image.asset(
                  'assets/otros/campo.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            // Jugadores en posiciones específicas
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.09),
              child: Column(
                children: [
                  // Delanteros
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      fws,
                      (int index) => SizedBox(
                        // width: cardWidth,
                        height: cardHeight,
                        child: PlayerCard(player: fp),
                      ),
                    ),
                  ),
                  SizedBox(height: rowSeparation),
                  // Mediocampistas
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      mids,
                      (int index) => SizedBox(
                        // width: cardWidth,
                        height: cardHeight,
                        child: PlayerCard(player: fp),
                      ),
                    ),
                  ),
                  SizedBox(height: rowSeparation),
                  // Defensores
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      defs,
                      (int index) => SizedBox(
                        // width: cardWidth,
                        height: cardHeight,
                        child: PlayerCard(player: fp),
                      ),
                    ),
                  ),
                  SizedBox(height: rowSeparation),
                  // Portero
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DropdownComponent(
                        options: provider.myPlayers,
                        onSelect: (opcion) {
                          provider.modificarElementoEnLista(0, 0, opcion);
                        },
                        child: SizedBox(
                          // width: cardWidth,
                          height: cardHeight,
                          child:
                              PlayerCard(player: provider.listaDeListas[0][0]),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
