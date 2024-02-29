import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

void openSearchBar() {}

void threeDotMenu() {}

class _HomePageState extends State<HomePage> {
  // ! my variables
  dynamic currentDate, currentTime;

  // ! my functions
  void getCurrentDateTime() {
    final now = DateTime.now();
    currentTime = DateFormat.jm().format(DateTime.now());
    currentDate = DateFormat('d/M').format(now);
  }

  @override
  void initState() {
    super.initState();
    getCurrentDateTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 28, 28),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 29, 28, 28),
        leadingWidth: 300,
        leading: Expanded(
          child: Row(
            children: [
              const Text(
                'Updated ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              Text(
                ' $currentDate  $currentTime',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        actions: [
          const IconButton(
            onPressed: openSearchBar,
            icon: Icon(Icons.search, color: Colors.white),
          ),
          PopupMenuButton(
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: Text(
                      'Settings',
                      style: TextStyle(
                        color: Colors.black,
                        backgroundColor: Colors.grey[400],
                      ),
                    ),
                  )
                ];
              })
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ! city name
                Text(
                  'OHIO',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 12),
                // ! temparature
                const Text('26°C',
                    style: TextStyle(
                      fontSize: 30,
                    )),
                const SizedBox(height: 12),
                Text(
                  '^26° ^13°',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 12),
                Text(
                  'CLEAR SKY',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        letterSpacing: 6,
                      ),
                ),
                const SizedBox(height: 20),

                const Divider(),
                // ! hourly forecast

                const Divider(),
                // ! daily forecast
              ],
            ),
          ),
        ),
      ),
    );
  }
}
