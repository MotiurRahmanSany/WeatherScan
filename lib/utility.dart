import 'package:intl/intl.dart';

//! capitalize first letter of a string

extension CapitalizeFirstLetter on String {
  String capFirstLetter() {
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }
}

//! Provides specific icons

String provideIconPath(String allWeatherConditions) {
  String iconPath = '';
  switch (allWeatherConditions.toString().toLowerCase()) {
    case 'light rain':
      iconPath = 'shower_rain';
    case 'broken clouds':
      iconPath = 'broken_clouds';
    case 'few clouds':
      iconPath = 'few_clouds';
    case 'mist':
      iconPath = 'mist';
    case 'rain':
      iconPath = 'rain';
    case 'scattered clouds':
      iconPath = 'scattered_clouds';
    case 'snow':
      iconPath = 'snow';
    case 'thunderstorm':
      iconPath = 'thunderstorm';
    case 'clear sky':
      iconPath = 'clear_sky';
  }
  return iconPath;
}

//! return real time sunrise/sunset in AM/PM

getRealTimeSunriseSunset(primaryTime) {
  return DateFormat.jm()
      .format(DateTime.fromMillisecondsSinceEpoch(primaryTime * 1000));
}
