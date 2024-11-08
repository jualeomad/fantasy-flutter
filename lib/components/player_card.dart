import 'package:fantasy_flutter/models/player.dart';
import 'package:fantasy_flutter/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlayerCard extends StatelessWidget {
  final Player player;
  static const double aspectRatio = 5 / 7;

  const PlayerCard({Key? key, required this.player}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calcula el ancho usando el alto y el aspecto deseado 5 / 7
        final double cardHeight = constraints.maxHeight;
        final double cardWidth = cardHeight * aspectRatio;

        return Center(
          child: Container(
            width: cardWidth,
            height: cardHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "assets/flags/${parseTeamName(player.team)}.png"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              children: [
                // Imagen del jugador
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10)),
                    child: Image.network(
                      player.imageUrl,
                      fit: BoxFit.contain, // Ajuste para cubrir el contenedor
                    ),
                  ),
                ),
                // ESCUDO
                Positioned(
                  width: cardWidth * 0.3,
                  // height: 25,
                  top: cardHeight * 0.05,
                  left: cardWidth * 0.05,
                  child: ClipRRect(
                    child: Center(
                      child: Image.asset(
                        'assets/escudos/${parseTeamName(player.team)}.png',
                        errorBuilder: (context, error, stackTrace) {
                          debugPrint("ERROR_IMAGE: $error");
                          return Text("");
                        },
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                // Box superior izquierda con el rating
                Positioned(
                  width: cardWidth * 0.3,
                  height: cardWidth * 0.3,
                  top: cardHeight * 0.05,
                  right: cardWidth * 0.05,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(7),
                    child: Container(
                      padding: EdgeInsets.all(2.0),
                      color: Color(0xFFd9d9d9),
                      child: Center(
                        child: Text(
                          player.rating.toString(),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.crimsonText(
                            fontSize: cardWidth * 0.18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Box inferior con el nombre del jugador
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    color: Color(0xFFd9d9d9),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        player.name.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: 8,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
