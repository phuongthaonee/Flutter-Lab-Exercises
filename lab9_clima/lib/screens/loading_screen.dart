import 'package:flutter/material.dart';
import 'package:lab9_clima/services/location.dart';
import 'package:lab9_clima/services/weather.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    try {
      // Get current location
      Location location = Location();
      await location.getCurrentLocation();

      // Get weather data for current location
      WeatherModel weatherModel = WeatherModel();
      var weatherData = await weatherModel.getLocationWeather(
        location.latitude!,
        location.longitude!,
      );

      // Navigate to location screen with weather data
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LocationScreen(locationWeather: weatherData),
          ),
        );
      }
    } catch (e) {
      print('Error getting location data: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${e.toString()}'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 5),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator(color: Colors.white)),
      backgroundColor: Color(0xFF0A3D62),
    );
  }
}
