import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ! my variables
  dynamic currentDate, currentTime;
  bool isSearchBarVisible = false;
  bool isSearchIconVisible = true;
  final TextEditingController getCityName = TextEditingController();

  // ! border
  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(50),
  );

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
      // ! appbar
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 29, 28, 28),
        leadingWidth: 300,
        leading: SizedBox(
          width: 300,
          child: Visibility(
            visible: !isSearchBarVisible,
            child: Row(
              children: [
                const Text(
                  '  Updated ',
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
        ),
        actions: [
          // ! Search

          // ! search icon
          Visibility(
            visible: isSearchIconVisible,
            child: IconButton(
              onPressed: () {
                setState(() {
                  isSearchBarVisible = true;
                  isSearchIconVisible = false;
                });
              },
              icon: const Icon(Icons.search, color: Colors.white),
            ),
          ),
          Visibility(
            visible: isSearchBarVisible,
            child: Expanded(
              // ! search field
              child: TextField(
                controller: getCityName,
                onSubmitted: (value) {},
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  hintText: 'Search a City...',
                  hintStyle: Theme.of(context).textTheme.labelSmall,
                  filled: true,
                  fillColor: const Color.fromARGB(255, 29, 28, 28),
                  focusedBorder: border,
                  enabledBorder: border,
                  prefixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isSearchBarVisible = false;
                        isSearchIconVisible = true;
                      });
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // ! PopupMenuButton

          Visibility(
            visible: isSearchIconVisible,
            child: PopupMenuButton(
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: Text(
                      'Settings',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                  PopupMenuItem(
                    child: Text(
                      'Help & feedback',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  )
                ];
              },
              onSelected: (value) {},
            ),
          )
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
