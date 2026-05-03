import 'package:flutter/material.dart';
import 'package:lab9_clima/services/weather.dart';
import 'package:lab9_clima/services/location.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  final dynamic locationWeather;

  const LocationScreen({super.key, required this.locationWeather});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  int? temperature;
  String weatherIcon = '';
  String cityName = '';
  String weatherMessage = '';

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        weatherMessage = 'Unable to get weather data';
        cityName = '';
        return;
      }

      try {
        // Extract temperature
        double temp = weatherData['main']['temp'];
        temperature = temp.toInt();

        // Get weather icon based on condition code
        int condition = weatherData['weather'][0]['id'];
        weatherIcon = weatherModel.getWeatherIcon(condition);

        // Get weather message based on temperature
        weatherMessage = weatherModel.getMessage(temperature!);

        // Get city name
        cityName = weatherData['name'];
      } catch (e) {
        print('Error parsing weather data: $e');
        temperature = 0;
        weatherIcon = 'Error';
        weatherMessage = 'Unable to parse weather data';
        cityName = '';
      }
    });
  }

  Future<void> refreshWeather() async {
    try {
      // Show loading indicator
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Refreshing weather...'),
            duration: Duration(seconds: 1),
          ),
        );
      }

      // Get current location
      Location location = Location();
      await location.getCurrentLocation();

      // Get weather data for current location
      var weatherData = await weatherModel.getLocationWeather(
        location.latitude!,
        location.longitude!,
      );

      updateUI(weatherData);
    } catch (e) {
      print('Error refreshing weather: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A3D62),
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF0A3D62), Color(0xFF1E5F8C)],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Top row with buttons
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Refresh button (get current location weather)
                    IconButton(
                      onPressed: refreshWeather,
                      icon: const Icon(Icons.near_me),
                      color: Colors.white,
                      iconSize: 40.0,
                    ),
                    // Search city button
                    IconButton(
                      onPressed: () async {
                        var typedCityName = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CityScreen(),
                          ),
                        );

                        if (typedCityName != null) {
                          try {
                            var weatherData = await weatherModel.getCityWeather(
                              typedCityName,
                            );
                            updateUI(weatherData);
                          } catch (e) {
                            print('Error getting city weather: $e');
                            if (mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Could not find weather for $typedCityName',
                                  ),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          }
                        }
                      },
                      icon: const Icon(Icons.location_city),
                      color: Colors.white,
                      iconSize: 40.0,
                    ),
                  ],
                ),
              ),

              // Weather icon and temperature
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Weather icon emoji
                    Text(weatherIcon, style: const TextStyle(fontSize: 100.0)),
                    const SizedBox(height: 20),
                    // Temperature
                    Text(
                      '$temperature°C',
                      style: const TextStyle(
                        fontSize: 80.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              // Bottom section with message and city
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  children: [
                    // Weather message
                    Text(
                      weatherMessage,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 28.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // City name
                    Text(
                      cityName,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 40.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
