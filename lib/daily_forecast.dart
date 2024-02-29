import 'package:flutter/material.dart';

class DailyForecast extends StatelessWidget {
  final IconData myIcon;
  final String minTemp, maxTemp, humidity;
  const DailyForecast({
    super.key,
    required this.myIcon,
    required this.minTemp,
    required this.maxTemp,
    required this.humidity,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Today'),
        Icon(myIcon),
        Row(
          children: [
            const Icon(Icons.water_drop_rounded),
            Text('$humidity%'),
          ],
        ),
        Text(
          '$maxTemp° / $minTemp°',
        ),
      ],
    );
  }
}
