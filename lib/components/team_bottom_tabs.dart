import 'package:flutter/material.dart';

class TeamBottomTabs extends StatefulWidget {
  const TeamBottomTabs({Key? key}) : super(key: key);

  @override
  _TeamBottomTabsState createState() => _TeamBottomTabsState();
}

class _TeamBottomTabsState extends State<TeamBottomTabs> {
  String _selectedTab = "ALINEACIÓN"; // Tab inicial seleccionada

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    ColorScheme cs = Theme.of(context).colorScheme;

    return Center(
      child: Container(
        width: screenWidth * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: SegmentedButton<String>(
          showSelectedIcon: false,
          segments: const [
            ButtonSegment(
              value: "ALINEACIÓN",
              label: Text("ALINEACIÓN"),
            ),
            ButtonSegment(
              value: "PLANTILLA",
              label: Text("PLANTILLA"),
            ),
            ButtonSegment(
              value: "PUNTOS",
              label: Text("PUNTOS"),
            ),
          ],
          selected: <String>{_selectedTab},
          onSelectionChanged: (newSelection) {
            setState(() {
              _selectedTab = newSelection.first;
            });
          },
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.resolveWith<Color>(
              (states) => states.contains(WidgetState.selected)
                  ? cs.secondary // Color del botón seleccionado
                  : cs.primary, // Color del botón no seleccionado
            ),
            foregroundColor: WidgetStateProperty.resolveWith<Color>(
              (states) => states.contains(WidgetState.selected)
                  ? cs.onPrimary // Color del texto seleccionado
                  : cs.onPrimary, // Color del texto no seleccionado
            ),
          ),
        ),
      ),
    );
  }
}
