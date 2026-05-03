@echo off
echo Downloading xylophone audio files...
echo.

curl -L "https://github.com/londonappbrewery/xylophone-flutter/raw/master/assets/note1.wav" -o "assets/note1.wav"
echo Downloaded note1.wav

curl -L "https://github.com/londonappbrewery/xylophone-flutter/raw/master/assets/note2.wav" -o "assets/note2.wav"
echo Downloaded note2.wav

curl -L "https://github.com/londonappbrewery/xylophone-flutter/raw/master/assets/note3.wav" -o "assets/note3.wav"
echo Downloaded note3.wav

curl -L "https://github.com/londonappbrewery/xylophone-flutter/raw/master/assets/note4.wav" -o "assets/note4.wav"
echo Downloaded note4.wav

curl -L "https://github.com/londonappbrewery/xylophone-flutter/raw/master/assets/note5.wav" -o "assets/note5.wav"
echo Downloaded note5.wav

curl -L "https://github.com/londonappbrewery/xylophone-flutter/raw/master/assets/note6.wav" -o "assets/note6.wav"
echo Downloaded note6.wav

curl -L "https://github.com/londonappbrewery/xylophone-flutter/raw/master/assets/note7.wav" -o "assets/note7.wav"
echo Downloaded note7.wav

echo.
echo All audio files downloaded successfully!
echo You can now run: flutter run
pause
