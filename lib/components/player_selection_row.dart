import 'package:fantasy_flutter/components/player_card.dart';
import 'package:fantasy_flutter/models/player.dart';
import 'package:fantasy_flutter/ui/custom_colors.dart';
import 'package:fantasy_flutter/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlayerSelectionRow extends StatelessWidget {
  final Player player;

  PlayerSelectionRow({required this.player});

  final double height = 100;
  final int pointsHistoryLength = 5;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: CustomColors.playerRowBg),
      child: Row(
        children: [
          // Primer widget que se adapta a su contenido y tiene una altura específica
          SizedBox(
            height: height,
            child: PlayerCard(player: player),
          ),
          // Segundo widget expandido que contiene dos columnas y respeta la altura
          Expanded(
            child: SizedBox(
              height: height,
              child: Row(
                children: [
                  // Primera columna que ocupa toda la altura disponible
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                            child: Row(
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Text(
                                    // player.name,
                                    player.apodo,
                                    style: GoogleFonts.inter(
                                        color: themeData.colorScheme.onPrimary,
                                        fontSize: 12),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                                SizedBox(width: 9),
                                // Contenedor cuadrado con letras centradas y padding uniforme
                                Container(
                                  width: 24,
                                  height: 24,
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Player.getBgColorByPosition(
                                        player.position), // Fondo del cuadrado
                                    borderRadius: BorderRadius.circular(
                                        3), // Bordes redondeados
                                  ),
                                  child: Center(
                                    child: Text(
                                      Player.parsePositionForSelectionScreen(
                                          player.position), // Las dos letras
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Row(
                              children: [
                                Icon(Icons.paid_outlined,
                                    color: themeData.colorScheme.onPrimary,
                                    size: 20),
                                Text("84.255.666",
                                    style: GoogleFonts.inter(
                                        color: Colors.white, fontSize: 10))
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:
                                List.generate(pointsHistoryLength, (index) {
                              return Container(
                                width: 23,
                                height: 23,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text('${index + 1}', // Número del 1 al 5
                                    style: GoogleFonts.crimsonText(
                                        color: themeData.colorScheme.surface)),
                              );
                            }),
                          ),
                        )),
                      ],
                    ),
                  ),
                  // Segunda columna que también ocupa toda la altura disponible
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                            height: height / 3, // Ejemplo: mitad de la altura
                            child: Row(
                              children: [
                                Icon(Icons.check_circle, color: Colors.green),
                                Text("Disponible",
                                    style: GoogleFonts.inter(color: Colors.white))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height / 3, // Ejemplo: mitad de la altura
                            child: Row(
                              children: [
                                Icon(Icons.lock_outline, color: Colors.white),
                                Text("9.651.845",
                                    style: GoogleFonts.inter(color: Colors.white))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height / 3, // Ejemplo: mitad de la altura
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(3, 5, 18, 5),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: CustomColors.yellowButton),
                                child: Center(
                                    child: Text("GESTIONAR",
                                        style: GoogleFonts.inter(
                                            color: Colors.white))),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
