import 'package:flutter/material.dart';

class HourlyForcast extends StatelessWidget {
  final String time, humidity, temperature;
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
          Icon(
            myIcon,
            color: Colors.white,
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
              const Icon(
                Icons.water_drop,
                color: Colors.white,
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
