import 'package:flutter/material.dart';

class DailyForecast extends StatelessWidget {
  final double minTemp, maxTemp;
  final String iconPath;
  const DailyForecast({
    super.key,
    required this.iconPath,
    required this.minTemp,
    required this.maxTemp,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Flexible(
          flex: 1,
          child: Text(
            'Today',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Flexible(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/icons/$iconPath.png',
                height: 42,
              ),
              Text(
                '${maxTemp.toStringAsFixed(0)}° / ${minTemp.toStringAsFixed(0)}°',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
