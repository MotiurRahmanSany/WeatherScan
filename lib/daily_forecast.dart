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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text(
          'Today',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Icon(
          myIcon,
          color: Colors.white,
        ),
        Text.rich(
          TextSpan(
            children: [
              const WidgetSpan(
                child: Icon(
                  Icons.water_drop,
                  color: Colors.white,
                ),
              ),
              const TextSpan(text: '   '),
              TextSpan(
                text: '$humidity%  ',
                style: const TextStyle(
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ),
        Text(
          '$maxTemp°   /   $minTemp°',
          style: const TextStyle(
            fontSize: 17,
          ),
        ),
      ],
    );
  }
}
