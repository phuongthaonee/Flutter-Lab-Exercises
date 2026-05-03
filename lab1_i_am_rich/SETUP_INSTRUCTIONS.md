# I Am Rich - Setup Instructions

## ✅ Completed Steps

1. **Updated `lib/main.dart`** with the required structure:
   - `main()` function calls `runApp(MyApp())`
   - `MyApp`: StatelessWidget with MaterialApp
   - `IAmRichPage`: StatelessWidget with Scaffold
   - AppBar with title "I Am Rich" and dark blue-grey background
   - Centered diamond image using Center and Image.asset widgets

2. **Updated `pubspec.yaml`** to include the diamond image asset

3. **Created `assets/images/` directory** for the diamond image

## 📋 Next Steps (Required)

### Step 1: Download a Diamond Image

You need to download a free diamond PNG image. Here are recommended sources:

- **Option 1**: https://www.pngall.com/diamond-png/
- **Option 2**: https://www.cleanpng.com/free/diamond-shape.html
- **Option 3**: https://www.vecteezy.com/free-png/diamond-pattern

### Step 2: Save the Image

1. Download a diamond PNG image (preferably with transparent background)
2. Rename it to `diamond.png`
3. Save it in the `assets/images/` directory
4. Final path should be: `assets/images/diamond.png`

### Step 3: Run the App

After placing the diamond image, run:

```bash
flutter pub get
flutter run
```

## 📱 Expected Result

The app will display:
- A dark blue-grey screen (Colors.blueGrey[900])
- An AppBar at the top with "I Am Rich" title
- A diamond image centered both horizontally and vertically

## 🏗️ Project Structure

```
lib/main.dart          ✅ Updated - Contains MyApp and IAmRichPage
pubspec.yaml           ✅ Updated - Assets configured
assets/images/         ✅ Created - Ready for diamond.png
  └── diamond.png      ⚠️  REQUIRED - Download and place here
```

## 📝 Code Summary

The implementation follows all requirements:
- ✅ StatelessWidget only (no state management)
- ✅ MaterialApp → Scaffold → Center → Image widget tree
- ✅ Dark blue-grey theme (Colors.blueGrey[900])
- ✅ Centered diamond image
- ✅ No animations or extra logic
- ✅ Clean, minimalist design
