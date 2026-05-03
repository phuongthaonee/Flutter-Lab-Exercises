# Clima App Setup Checklist ✅

Follow these steps to get your Clima weather app running:

## ✅ Completed (Already Done)

- [x] Flutter project structure created
- [x] Dependencies added to `pubspec.yaml` (geolocator, http)
- [x] Dependencies installed (`flutter pub get`)
- [x] Android permissions configured (AndroidManifest.xml)
- [x] iOS permissions configured (Info.plist)
- [x] All service files created (location, networking, weather, api_key)
- [x] All screen files created (loading, location, city)
- [x] Main app entry point configured
- [x] API key file added to .gitignore

## 🔧 You Need To Do

### 1. Get OpenWeatherMap API Key (REQUIRED)

- [ ] Go to https://openweathermap.org/
- [ ] Create a FREE account
- [ ] Navigate to API Keys section in your account
- [ ] Copy your API key
- [ ] **WAIT**: New keys can take up to 2 hours to activate!

### 2. Configure Your API Key

- [ ] Open `lib/services/api_key.dart`
- [ ] Replace `'PASTE_YOUR_KEY_HERE'` with your actual API key
- [ ] Save the file
- [ ] **VERIFY**: The file should look like:
  ```dart
  const apiKey = 'a1b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6';
  ```

### 3. Test the App

- [ ] Connect a real device OR start an emulator with GPS
- [ ] Run: `flutter run`
- [ ] Grant location permission when prompted
- [ ] Wait for weather data to load
- [ ] Test the refresh button (GPS icon)
- [ ] Test the city search button (city icon)
- [ ] Search for different cities

## 📱 Testing Checklist

- [ ] App loads and shows loading screen
- [ ] Location permission is requested
- [ ] Weather data displays correctly
- [ ] Temperature shows in Celsius
- [ ] Weather emoji appears
- [ ] City name displays
- [ ] Refresh button works (GPS icon)
- [ ] City search button opens search screen
- [ ] Can type city name and get weather
- [ ] Error handling works (try invalid city name)

## 🐛 Common Issues

### Issue: "Invalid API key"
**Solution**: 
- Check your API key is correct in `api_key.dart`
- Wait 2 hours after registration for key activation
- Verify no extra spaces in the key string

### Issue: "Location permission denied"
**Solution**:
- Go to device Settings → Apps → lab9_clima → Permissions
- Enable Location permission
- Restart the app

### Issue: "City not found"
**Solution**:
- Check spelling of city name
- Try a major city (e.g., "London", "Tokyo", "New York")
- Ensure internet connection is active

### Issue: App crashes on startup
**Solution**:
- Run `flutter clean`
- Run `flutter pub get`
- Run `flutter run` again

## 📝 Notes

- The app requires an active internet connection
- GPS works best on real devices (emulators may have issues)
- Temperature is displayed in Celsius
- Weather data updates when you refresh or search
- The API key file is in .gitignore (won't be committed to Git)

## 🚀 Ready to Run?

Once you've completed the "You Need To Do" section, run:

```bash
flutter run
```

Enjoy your weather app! 🌤️
