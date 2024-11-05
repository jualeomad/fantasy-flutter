import 'package:fantasy_flutter/components/player_card.dart';
import 'package:fantasy_flutter/models/player.dart';
import 'package:flutter/material.dart';

class DropdownComponent extends StatelessWidget {
  final List<Player> options;
  final Function onSelect;
  final Widget child; // Propiedad para recibir un widget genérico

  DropdownComponent({
    required this.options,
    required this.onSelect,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true, // Para que sea FullScreen
          backgroundColor: Colors.transparent, // Fondo transparente
          builder: (BuildContext context) {
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context)
                        .colorScheme
                        .surface
                        .withOpacity(0.3), // Color de inicio del degradado
                    Theme.of(context)
                        .colorScheme
                        .surface
                        .withOpacity(0.8), // Color de inicio del degradado
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16)), // Borde superior redondeado
              ),
              height: 700,
              child: Padding(
                padding: EdgeInsets.only(top: 30),
                child: GridView.builder(
                  padding: EdgeInsets.all(8.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1,
                    crossAxisCount: 3, // Número de columnas
                    crossAxisSpacing: 15.0, // Espacio horizontal entre cartas
                    mainAxisSpacing: 15.0, // Espacio vertical entre cartas
                  ),
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        onSelect(options[index]);
                        Navigator.of(context).pop();
                      },
                      child: PlayerCard(player: options[index]),
                    );
                  },
                ),
              ),
            );
          },
        );
      },
      child: child, // Utiliza el widget genérico como hijo
    );
  }
}
