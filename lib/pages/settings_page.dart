import 'package:flutter/material.dart';
import 'package:weather_scan/widgets/about_weather_scan.dart';
import 'package:weather_scan/widgets/custom_divider.dart';
import 'package:weather_scan/widgets/settings_list_tile.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
            GestureDetector(
              onTap: () => showDialog(
                title: Image.asset('assets/icons/open_weather_logo.png'),
                content: const Text(
                  '''WeatherScan receives data from OpenWeatherMap's free service,
                  which is limited to only 1000 calls per day. You could receive 
                  your own 1000 calls by registering your API key for free here. 
                  Otherwise calls are shared between all WeatherScan 
                  users who use the default API key.''',
                ),
              ),
              child: const SettingTile(
                title: 'About WeatherScan',
                icon: Icons.info_outline,
              ),
            )
          ],
        ),
      ),
    );
  }
}
