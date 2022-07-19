class Interpratation {
  String getHumidityInt(int humidity) {
    if (humidity < 40) {
      return 'Humidity is low ';
    } else if (humidity < 65) {
      return 'Humidity is normal';
    } else if (humidity < 100) {
      return 'Humidity is high';
    } else if (humidity >= 100) {
      return 'Humidity is quite high';
    } else {
      return 'unknown';
    }
  }

  String? getFellsTemperatureInt(int feelsTemperature, int temperature) {
    if (feelsTemperature == temperature ||
        feelsTemperature + 1 == temperature ||
        feelsTemperature - 1 == temperature ||
        feelsTemperature + 2 == temperature ||
        feelsTemperature - 2 == temperature ||
        feelsTemperature + 3 == temperature ||
        feelsTemperature - 3 == temperature) {
      return 'Similar to the actual temperature';
    } else if (feelsTemperature + 4 >= temperature) {
      return 'You may feel hotter';
    } else if (feelsTemperature - 4 <= temperature) {
      return 'You may feel colder';
    } else {
      return '🤷unknown';
    }
  }
}
