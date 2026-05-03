Write-Host "Downloading xylophone audio files..." -ForegroundColor Green
Write-Host ""

$baseUrl = "https://github.com/londonappbrewery/xylophone-flutter/raw/master/assets"
$files = @("note1.wav", "note2.wav", "note3.wav", "note4.wav", "note5.wav", "note6.wav", "note7.wav")

foreach ($file in $files) {
    $url = "$baseUrl/$file"
    $output = "assets/$file"
    
    Write-Host "Downloading $file..." -ForegroundColor Yellow
    Invoke-WebRequest -Uri $url -OutFile $output
    Write-Host "✓ Downloaded $file" -ForegroundColor Green
}

Write-Host ""
Write-Host "All audio files downloaded successfully!" -ForegroundColor Green
Write-Host "You can now run: flutter run" -ForegroundColor Cyan
