import 'package:flutter/material.dart';

class HourlyForcast extends StatelessWidget {
  final String time, temperature, humidity;
  final IconData myIcon;
  const HourlyForcast({
    super.key,
    required this.time,
    required this.myIcon,
    required this.temperature,
    required this.humidity,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          time,
          style: TextStyle(color: Colors.grey[700]),
        ),
        const SizedBox(height: 20),
        Icon(myIcon),
        const SizedBox(height: 20),
        Text('$temperature°'),
        Row(
          children: [
            const Icon(Icons.water_drop),
            Text('$humidity%'),
          ],
        ),
      ],
    );
  }
}
