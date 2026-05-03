import 'networking.dart';
import 'api_key.dart';

const openWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getLocationWeather(double lat, double lon) async {
    String url =
        '$openWeatherMapUrl?lat=$lat&lon=$lon&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getCityWeather(String cityName) async {
    String url = '$openWeatherMapUrl?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩'; // thunderstorm
    } else if (condition < 400) {
      return '🌧'; // drizzle
    } else if (condition < 600) {
      return '☔'; // rain
    } else if (condition < 700) {
      return '☃️'; // snow
    } else if (condition < 800) {
      return '🌫'; // mist/fog
    } else if (condition == 800) {
      return '☀️'; // clear
    } else if (condition <= 804) {
      return '⛅'; // clouds
    } else {
      return '🤷'; // unknown
    }
  }

  String getMessage(int temp) {
    if (temp > 35) {
      return "It's 🍦 time";
    } else if (temp > 25) {
      return "Time for shorts and 👕";
    } else if (temp > 20) {
      return "Bring a 🧥 just in case";
    } else if (temp > 10) {
      return "You'll need 🧣 and 🧤";
    } else {
      return "Time for hot ☕ and some 🏠";
    }
  }
}
