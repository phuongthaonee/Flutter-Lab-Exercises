import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async {
    // Check current permission status
    LocationPermission permission = await Geolocator.checkPermission();

    // If permission is denied, request it
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    // If permission is permanently denied, throw an exception
    if (permission == LocationPermission.deniedForever) {
      throw Exception(
        'Location permissions are permanently denied. '
        'Please enable location access in your device settings.',
      );
    }

    // If permission is still denied after request, throw an exception
    if (permission == LocationPermission.denied) {
      throw Exception('Location permissions are denied.');
    }

    // Get the current position
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );

      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      throw Exception('Failed to get location: $e');
    }
  }
}
