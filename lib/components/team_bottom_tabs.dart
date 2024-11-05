// TeamBottomTabs.dart

import 'package:flutter/material.dart';

class TeamBottomTabs extends StatefulWidget {
  final ValueChanged<String> onTabSelected;

  const TeamBottomTabs({Key? key, required this.onTabSelected})
      : super(key: key);

  @override
  _TeamBottomTabsState createState() => _TeamBottomTabsState();
}

class _TeamBottomTabsState extends State<TeamBottomTabs> {
  String _selectedTab = "ALINEACIÓN"; // Initial selected tab

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
              widget.onTabSelected(
                  _selectedTab); // Notify TeamScreen of the new selection
            });
          },
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.resolveWith<Color>(
              (states) => states.contains(WidgetState.selected)
                  ? cs.secondary // Selected button color
                  : cs.primary, // Non-selected button color
            ),
            foregroundColor: WidgetStateProperty.resolveWith<Color>(
              (states) => states.contains(WidgetState.selected)
                  ? cs.onPrimary // Selected text color
                  : cs.onPrimary, // Non-selected text color
            ),
          ),
        ),
      ),
    );
  }
}
