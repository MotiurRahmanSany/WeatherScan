import 'package:flutter/material.dart';

class DailyForecast extends StatelessWidget {
  final String minTemp, maxTemp, humidity, iconPath;
  const DailyForecast({
    super.key,
    required this.iconPath,
    required this.minTemp,
    required this.maxTemp,
    required this.humidity,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/icons/$iconPath.png',
                height: 32,
                width: 50,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    WidgetSpan(
                      child: Image.asset(
                        'assets/icons/humidity.png',
                        height: 20,
                      ),
                    ),
                    const TextSpan(text: ' '),
                    TextSpan(
                      text: '$humidity%  ',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '$maxTemp° / $minTemp°',
                style: const TextStyle(
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
