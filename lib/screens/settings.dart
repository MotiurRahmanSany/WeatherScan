import 'package:flutter/material.dart';
import 'package:weather_scan/widgets/custom_divider.dart';
import 'package:weather_scan/widgets/settings_list_tile.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 28, 28),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 29, 28, 28),
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            //! General
            Text(
              'General',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SettingTile(
              title: 'Unit system',
              subtitle: 'Metric',
              icon: Icons.checklist_rtl_rounded,
            ),
            //! Interaface
            const AddingADivider(),

            Text(
              'Interface',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SettingTile(
              title: 'Theme',
              subtitle: 'System default',
            ),
            const SettingTile(
              title: 'Dark theme',
              subtitle: 'Default',
            ),
            //! API key
            const AddingADivider(),
            Text(
              'API key',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SettingTile(
              title: 'API key',
              icon: Icons.keyboard_alt_outlined,
              subtitle: 'Currently using default API key (not recommended)',
            ),
            const SettingTile(
              title: 'Reset API key',
              icon: Icons.restore,
            ),
            const SettingTile(
              title: 'Learn more',
              icon: Icons.open_in_new,
            ),

            //! About
            const AddingADivider(),
            
            Text(
              'About',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SettingTile(
              title: 'About WeatherScan',
              icon: Icons.info_outline,
            )
          ],
        ),
      ),
    );
  }
}
