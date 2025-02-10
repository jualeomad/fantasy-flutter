import 'package:fantasy_flutter/components/main_drawer.dart';
import 'package:fantasy_flutter/components/partidos_screen/jornada_partidos.dart';
import 'package:fantasy_flutter/ui/custom_colors.dart';
import 'package:fantasy_flutter/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PartidosScreen extends StatelessWidget {
  const PartidosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          toolbarHeight: 35, // DEFAULT: 56
          flexibleSpace: ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(
                  0.2), // Ajusta la opacidad para oscurecer la imagen
              BlendMode.darken, // El modo de mezcla que oscurece la imagen
            ),
            child: Image.asset(
              'assets/otros/scaffold_bg.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          title: RichText(
              text: TextSpan(
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w600, // Inter SemiBold
              fontSize: 28,
              color: themeData.colorScheme.onPrimary,
            ), // Estilo por defecto
            children: [
              TextSpan(
                text: "P",
                style: TextStyle(
                    color: CustomColors.yellowButton), // Color amarillo para "P"
              ),
              TextSpan(
                text: "ro", // El resto del texto
              ),
              TextSpan(
                  text: "M",
                  style: TextStyle(color: CustomColors.yellowButton)),
              TextSpan(
                text: "anager", // El resto del texto
              ),
            ],
          )),
          centerTitle: true,
          
        ),
        body: JornadaPartidos());
  }
}
