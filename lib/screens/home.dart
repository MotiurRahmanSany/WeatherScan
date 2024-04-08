import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:weather_scan/utilities/api_key.dart';
import 'package:weather_scan/widgets/custom_divider.dart';
import 'package:weather_scan/widgets/daily_forecast.dart';
import 'package:weather_scan/widgets/hourly_forecast.dart';
import 'package:weather_scan/widgets/pop_up_menu_button.dart';
import 'package:weather_scan/utilities/utility.dart';
import 'package:weather_scan/widgets/weather_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ! my variables
  dynamic currentDate, currentTime;
  bool isSearchBarVisible = false;
  bool isSearchIconVisible = true;
  bool isUpdatedBarVisible = false;
  bool isNotRefreshUsed = true;
  final TextEditingController getCityName = TextEditingController();
  String currentCityName = 'Rajshahi';
  final String apiTempUnit = 'metric';

  // ! border
  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(50),
  );

  // ! my functions

  void _getCurrentLocation() {}

  void _fetchWeatherData() {
    setState(() {
      isSearchIconVisible = true;
      isSearchBarVisible = false;
      isUpdatedBarVisible = false;
      currentCityName = getCityName.text.capFirstLetter();
      weather = _getCurrentWeather();
      getCityName.clear();
    });
  }

  Future<void> refreshTheData() async {
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );
    setState(() {
      isNotRefreshUsed = false;
      isSearchIconVisible = true;
      isSearchBarVisible = false;
      isUpdatedBarVisible = false;
      getCityName.clear();
      currentCityName = getCityName.text;
      weather = _getCurrentWeather();
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
        throw 'We are facing some trouble!!';
      }
      setState(() {
        isUpdatedBarVisible = true;
        _getCurrentDateTime();
      });
      return weatherData;
    } catch (err) {
      throw 'We are facing some trouble!!';
    }
  }

  // ! implementing initState...
  @override
  void initState() {
    super.initState();
    weather = _getCurrentWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      // ! appbar
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        leadingWidth: 300,
        leading: SizedBox(
          width: 300,
          child: Visibility(
            visible: !isSearchBarVisible,
            child: Row(
              children: [
                Visibility(
                  visible: isUpdatedBarVisible,
                  child: Text(
                    '  Updated $currentDate  $currentTime',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
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
              // ! search a city TextField
              child: TextField(
                controller: getCityName,
                onSubmitted: (value) {
                  _fetchWeatherData();
                  FocusScope.of(context).unfocus();
                },
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  hintText: 'Search a City...',
                  hintStyle: Theme.of(context).textTheme.labelSmall,
                  filled: true,
                  fillColor: Colors.grey.shade900,
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
            child: const PopUpMenu(),
          )
        ],
      ),

      //! body starts here...

      body: RefreshIndicator(
        color: Colors.black,
        onRefresh: refreshTheData,
        child: FutureBuilder(
          future: weather,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting &&
                isNotRefreshUsed) {
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
            }
            if (snapshot.connectionState == ConnectionState.waiting &&
                !isNotRefreshUsed) {
              return LinearProgressIndicator(
                color: Colors.grey.shade800,
              );
            }
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            if (snapshot.hasData) {
              // ! destructuring api data...
              final weatherData = snapshot.data!;
              final currentWeatherData = weatherData['list'][0];
              final currentTemp = currentWeatherData['main']['temp'].round();
              final currentSkyDescription =
                  currentWeatherData['weather'][0]['description'];
              final currentHumidity = currentWeatherData['main']['humidity'];
              final currentWindSpeed = currentWeatherData['wind']['speed'];
              final currenPressure = currentWeatherData['main']['pressure'];
              final feelsLike = currentWeatherData['main']['feels_like'];
              final maxTemp = currentWeatherData['main']['temp_max'];
              final minTemp = currentWeatherData['main']['temp_min'];
              final sunrise = weatherData['city']['sunrise'];
              final sunset = weatherData['city']['sunset'];
              final visibility = weatherData['list'][0]['visibility'];

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
                          // ! current main temparature
                          Text(
                            '$currentTemp °C',
                            style: const TextStyle(
                              fontSize: 50,
                            ),
                          ),
                          // ! maximum/minimum temparature
                          Text.rich(
                            TextSpan(
                              children: [
                                const WidgetSpan(
                                  child: Icon(Icons.keyboard_arrow_up,
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
                                    Icons.keyboard_arrow_down,
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
                          // ! weather condition description
                          Text(
                            currentSkyDescription.toString().toUpperCase(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  letterSpacing: 6,
                                  fontSize: 23,
                                ),
                          ),
                          const SizedBox(height: 20),

                          const AddingADivider(),
                          // ! hourly forecast
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 145,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 20,
                              itemBuilder: (context, index) {
                                final temp = weatherData['list'][index + 1]
                                    ['main']['temp'];
                                final skyCondition = weatherData['list']
                                        [index + 1]['weather'][0]['main']
                                    .toString();
                                final humidity = weatherData['list'][index + 1]
                                    ['main']['humidity'];
                                final time = DateTime.parse(
                                  weatherData['list'][index + 1]['dt_txt'],
                                );

                                return HourlyForcast(
                                  time: DateFormat.jz().format(time),
                                  iconPath: provideIconPath(skyCondition),
                                  temperature: temp.toStringAsFixed(0),
                                  humidity: humidity.toString(),
                                );
                              },
                            ),
                          ),
                          const AddingADivider(),

                          // ! daily forecast
                          SizedBox(
                            height: 305,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 7,
                              itemBuilder: (context, index) {
                                final skyCondition = weatherData['list']
                                        [index + 1]['weather'][0]['main']
                                    .toString();
                                final minTemp = weatherData['list'][index + 1]
                                    ['main']['temp_min'];
                                final maxTemp = weatherData['list'][index + 1]
                                    ['main']['temp_max'];
                                return DailyForecast(
                                  iconPath: provideIconPath(skyCondition),
                                  minTemp: minTemp,
                                  maxTemp: maxTemp,
                                );
                              },
                            ),
                          ),

                          const AddingADivider(),

                          // ! Weather Details Grid view

                          SizedBox(
                            height: 345,
                            child: GridView(
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 0,
                                mainAxisSpacing: 0,
                                // childAspectRatio: 16 / 9,
                              ),
                              children: [
                                WeatherDetails(
                                  icon: Icons.thermostat,
                                  title: 'Feels Like',
                                  value: '$feelsLike°',
                                ),
                                WeatherDetails(
                                  icon: Icons.water_drop_outlined,
                                  title: 'Humidity',
                                  value: '$currentHumidity%',
                                ),
                                WeatherDetails(
                                  icon: Icons.air_outlined,
                                  title: 'Wind Speed',
                                  value: '$currentWindSpeed Km/h',
                                ),
                                const WeatherDetails(
                                  icon: Icons.cloud,
                                  title: 'Clouds',
                                  value: '2%',
                                ),
                                WeatherDetails(
                                  icon: Icons.visibility_outlined,
                                  title: 'Visibility',
                                  value: '${((visibility as int) / 1000)} Km',
                                ),
                                const WeatherDetails(
                                  icon: Icons.cloudy_snowing,
                                  title: 'Rain Chances',
                                  value: '0%',
                                ),
                                WeatherDetails(
                                  icon: Icons.sunny,
                                  title: 'Sunrise',
                                  value: getRealTimeSunriseSunset(sunrise),
                                ),
                                WeatherDetails(
                                  icon: Icons.nightlight_outlined,
                                  title: 'Sunset',
                                  value: getRealTimeSunriseSunset(sunset),
                                ),
                                WeatherDetails(
                                  icon: Icons.wind_power,
                                  title: 'Pressure',
                                  value: '$currenPressure mbar',
                                ),
                              ],
                            ),
                          ),
                          const AddingADivider(),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
            return const Text('');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getCurrentLocation,
        backgroundColor: Colors.white,
        child: const Icon(Icons.location_on),
      ),
    );
  }
}
