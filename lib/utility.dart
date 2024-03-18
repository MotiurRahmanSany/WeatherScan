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
  switch (allWeatherConditions.toString()) {
    case 'Rain':
      iconPath = 'shower_rain';
    case 'Clouds':
      iconPath = 'broken_clouds';
    case 'Mist':
      iconPath = 'mist';
    case 'Snow':
      iconPath = 'snow';
    case 'Thunderstorm':
      iconPath = 'thunderstorm';
    case 'Clear':
      iconPath = 'clear_sky';
  }
  return iconPath;
}

//! return real time sunrise/sunset in AM/PM

getRealTimeSunriseSunset(primaryTime) {
  return DateFormat.jm()
      .format(DateTime.fromMillisecondsSinceEpoch(primaryTime * 1000));
}
