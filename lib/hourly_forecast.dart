import 'package:flutter/material.dart';

class HourlyForcast extends StatelessWidget {
  final String time, humidity, temperature, iconPath;
  const HourlyForcast({
    super.key,
    required this.time,
    required this.temperature,
    required this.humidity,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          Text(
            time,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10),
          Image.asset(
            'assets/icons/$iconPath.png',
            height: 32,
            width: 50,
          ),
          const SizedBox(height: 10),
          Text(
            '$temperature°',
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          Row(
            children: [
              Image.asset(
                'assets/icons/humidity.png',
                height: 20,
              ),
              Text(
                '$humidity%',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
