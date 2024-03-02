import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:weather_scan/api_key.dart';
import 'package:weather_scan/custom_divider.dart';

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
  final String currentCityName = 'Rajshahi';
  final String apiTempUnit = 'metric';

  // ! border
  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(50),
  );

  // ! my functions
  void _fetchWeatherData() {
    setState(() {
      weather = _getCurrentWeather();
      _getCurrentDateTime();
    });
  }

  void _getCurrentDateTime() {
    final now = DateTime.now();
    currentTime = DateFormat.jm().format(DateTime.now());
    currentDate = DateFormat('d/M').format(now);
  }

  // ! fetching weather data from api
  late Future<Map<String, dynamic>> weather = _getCurrentWeather();
  Future<Map<String, dynamic>> _getCurrentWeather() async {
    try {
      final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?q=$currentCityName&units=$apiTempUnit&APPID=$weatherAPIKey',
      );
      final response = await http.get(url);
      final weatherData = jsonDecode(response.body);
      if (weatherData['cod'] != '200') {
        throw 'Some enternal error might have occurred!';
      }
      return weatherData;
    } catch (err) {
      throw err.toString();
    }
  }

  @override
  void initState() {
    super.initState();
    weather = _getCurrentWeather();
    _getCurrentDateTime();
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
                onSubmitted: (value) {
                  _fetchWeatherData();
                },
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
      body: FutureBuilder(
        future: weather,
        builder: (context, snapshot) {
          // if (snapshot.connectionState == ConnectionState.waiting) {
          //   return const Center(child: CircularProgressIndicator());
          // }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          if (snapshot.hasData) {
            // ! destructuring api data...
            final weatherData = snapshot.data!;
            final currentWeatherData = weatherData['list'][0];
            final currentTemp = currentWeatherData['main']['temp'].round();
            final currentSkyMain = currentWeatherData['weather'][0]['main'];
            final currentSkyDescription =
                currentWeatherData['weather'][0]['description'];
            final currentHumidity = currentWeatherData['main']['humidity'];
            final currentWindSpeed = currentWeatherData['wind']['speed'];
            final currenPressure = currentWeatherData['main']['pressure'];
            final feelsLike = currentWeatherData['main']['feels_like'];
            final maxTemp = currentWeatherData['main']['temp_max'].round();
            final minTemp = currentWeatherData['main']['temp_min'].round();
            final sunrise = weatherData['city']['sunrise'];
            final sunset = weatherData['city']['sunset'];

            return SingleChildScrollView(
              child: SafeArea(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // ! city name
                        Text(
                          currentCityName.toUpperCase(),
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 12),
                        // ! current temparature
                        Text(
                          '$currentTemp °C',
                          style: const TextStyle(
                            fontSize: 45,
                          ),
                        ),
                        // const SizedBox(height: 12),
                        // ! maximum/minimum temparature
                        Text.rich(
                          TextSpan(
                            children: [
                              const WidgetSpan(
                                child: Icon(Icons.keyboard_double_arrow_up,
                                    size: 20, color: Colors.white),
                              ),
                              TextSpan(
                                text: '$maxTemp°',
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              const TextSpan(text: ' '),
                              const WidgetSpan(
                                child: Icon(
                                  Icons.keyboard_double_arrow_down,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                              TextSpan(
                                text: '$minTemp°',
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        // ! sky description
                        Text(
                          currentSkyDescription.toString().toUpperCase(),
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    letterSpacing: 6,
                                  ),
                        ),
                        const SizedBox(height: 20),

                        // const Divider(),
                        const AddingADivider(),
                        // ! hourly forecast
                        const SizedBox(height: 20),

                        const AddingADivider(),

                        // ! daily forecast
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Loading Weather Info...',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(height: 10),
              CircularProgressIndicator(
                color: Colors.white,
              ),
            ],
          );
        },
      ),
    );
  }
}
