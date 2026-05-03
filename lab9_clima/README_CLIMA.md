# Clima Weather App 🌦️

A Flutter weather application that shows live weather data based on GPS location and allows city search.

## Features

- 📍 Automatic GPS location detection
- 🌡️ Real-time weather data from OpenWeatherMap API
- 🔍 Search weather by city name
- 🎨 Beautiful gradient UI
- 🔄 Refresh weather data
- 😊 Weather-based emoji icons and messages

## Setup Instructions

### 1. Get Your API Key

1. Register for a **FREE** account at [OpenWeatherMap](https://openweathermap.org/)
2. Get your API key from your account dashboard
3. **IMPORTANT**: New API keys can take up to 2 hours to activate

### 2. Configure API Key

1. Open `lib/services/api_key.dart`
2. Replace `'PASTE_YOUR_KEY_HERE'` with your actual API key:
   ```dart
   const apiKey = 'your_actual_api_key_here';
   ```
3. **NEVER commit this file to Git** (it's already in .gitignore)

### 3. Install Dependencies

```bash
flutter pub get
```

### 4. Run the App

**Requirements**: A real device or emulator with GPS capability

```bash
flutter run
```

## Project Structure

```
lib/
├── main.dart                      # App entry point
├── screens/
│   ├── loading_screen.dart        # Initial loading screen with GPS fetch
│   ├── location_screen.dart       # Main weather display screen
│   └── city_screen.dart           # City search screen
└── services/
    ├── api_key.dart               # API key (DO NOT COMMIT)
    ├── location.dart              # GPS location service
    ├── networking.dart            # HTTP networking service
    └── weather.dart               # Weather data service
```

## Permissions

### Android
Permissions are already configured in `android/app/src/main/AndroidManifest.xml`:
- ACCESS_FINE_LOCATION
- ACCESS_COARSE_LOCATION
- INTERNET

### iOS
Permission is already configured in `ios/Runner/Info.plist`:
- NSLocationWhenInUseUsageDescription

## How It Works

1. **Loading Screen**: Requests GPS permission and fetches current location weather
2. **Location Screen**: Displays weather with:
   - Weather icon emoji based on conditions
   - Temperature in Celsius
   - Weather-appropriate message
   - City name
   - Refresh button (GPS icon) - gets current location weather
   - Search button (city icon) - opens city search
3. **City Screen**: Enter any city name to get its weather

## API Integration

- Uses OpenWeatherMap Current Weather API
- Endpoint: `https://api.openweathermap.org/data/2.5/weather`
- Units: Metric (Celsius)
- Data includes: temperature, weather conditions, city name

## Error Handling

- GPS permission denied → User-friendly error message
- HTTP errors → Exception with status code
- Invalid city name → Error notification
- Network issues → Graceful error handling

## Dependencies

- `geolocator: ^12.0.0` - GPS location services
- `http: ^1.2.0` - HTTP networking
- `cupertino_icons: ^1.0.8` - iOS-style icons

## Testing

1. Test GPS location on a real device (emulators may have limited GPS)
2. Test city search with various city names
3. Test error handling by denying location permission
4. Test refresh functionality

## Notes

- The app uses `async/await` for all asynchronous operations
- Data is passed between screens using Navigator
- City search uses `await Navigator.push()` to receive the typed city name
- All API and GPS logic is separated into service classes
- UI screens only call service methods (clean architecture)

## Troubleshooting

### "API key not activated"
- Wait up to 2 hours after registration
- Verify your API key is correct in `api_key.dart`

### "Location permission denied"
- Grant location permission in device settings
- Restart the app

### "City not found"
- Check spelling
- Try a major city name
- Ensure internet connection is active

## Color Scheme

- Primary: `#0A3D62` (Deep Blue)
- Secondary: `#1E5F8C` (Ocean Blue)
- Text: White
- Gradient background for visual appeal

---

**Built with Flutter 💙**
