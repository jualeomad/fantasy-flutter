import 'package:fantasy_flutter/components/main_drawer.dart';
import 'package:fantasy_flutter/screens/tabs/team_screen.dart';
import 'package:fantasy_flutter/ui/custom_colors.dart';
import 'package:fantasy_flutter/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LigaScreen extends StatelessWidget {
  const LigaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
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
            bottom: const TabBar(
              dividerHeight:
                  0, // Linea separadora de la tab de navegación de la screen
              tabs: [
                Tab(
                  icon: Icon(Icons.home_outlined),
                  text: "INICIO",
                ),
                Tab(icon: Icon(Icons.chat_outlined), text: "CHATS"),
                Tab(icon: Icon(Icons.sports_soccer_outlined), text: "EQUIPO"),
                Tab(
                    icon: Icon(Icons.currency_exchange_outlined),
                    text: "MERCADO"),
                Tab(
                  icon: Icon(Icons.emoji_events_outlined),
                  text: "TABLA",
                ),
              ],
            ),
          ),
          body: const TabBarView(children: [
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
            TeamScreen(),
            Icon(Icons.directions_bike),
            Icon(Icons.directions_bike),
          ])),
    );
  }
}
