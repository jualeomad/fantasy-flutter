// TeamScreen.dart

import 'package:fantasy_flutter/components/team_bottom_tabs.dart';
import 'package:fantasy_flutter/components/team_grid.dart';
import 'package:fantasy_flutter/components/team_tab_manager.dart';
import 'package:fantasy_flutter/providers/team_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ValueNotifier to track selected tab and update `TeamGrid`
    final ValueNotifier<String> selectedTabNotifier =
        ValueNotifier("ALINEACIÓN");

    return ChangeNotifierProvider(
      create: (_) =>
          TeamProvider()..fetchPlayers(), // Load players on provider creation
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
                  child: ValueListenableBuilder<String>(
                    valueListenable: selectedTabNotifier,
                    builder: (context, selectedTab, child) {
                      return TeamTabManager(
                          selectedTab:
                              selectedTab); // Pass selectedTab to TeamGrid
                    },
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: TeamBottomTabs(
                    onTabSelected: (selectedTab) {
                      selectedTabNotifier.value =
                          selectedTab; // Update selectedTabNotifier
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
