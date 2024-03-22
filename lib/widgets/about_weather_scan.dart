import 'package:flutter/material.dart';

class AboutWeatherScan extends StatelessWidget {
  const AboutWeatherScan({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: Image.asset('assets/icons/open_weather_logo.png', ),
      
    );
  }
}
