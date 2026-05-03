# Connect Flutter to Android Phone via WiFi

## Prerequisites
- Android phone with USB debugging enabled
- Phone and computer on the same WiFi network
- USB cable (for initial setup only)

## Method 1: Using ADB WiFi (Android 11+)

### Step 1: Enable Wireless Debugging on Phone
1. Go to **Settings** → **Developer Options**
2. Enable **Wireless debugging**
3. Tap on **Wireless debugging** to see the IP address and port
4. Note down the IP address and port (e.g., 192.168.1.100:12345)

### Step 2: Pair the Device (First Time Only)
1. On your phone, tap **Pair device with pairing code**
2. Note the pairing code, IP address, and port
3. On your computer, run:
```bash
adb pair <IP>:<PORT>
```
Example:
```bash
adb pair 192.168.1.100:37829
```
4. Enter the pairing code when prompted

### Step 3: Connect via WiFi
```bash
adb connect <IP>:<PORT>
```
Example:
```bash
adb connect 192.168.1.100:12345
```

### Step 4: Verify Connection
```bash
flutter devices
```

### Step 5: Run Your App
```bash
flutter run
```

---

## Method 2: Using USB Cable First (Android 10 and below)

### Step 1: Connect Phone via USB
1. Connect your phone to computer with USB cable
2. Enable **USB debugging** in Developer Options
3. Accept the debugging authorization on your phone

### Step 2: Check Device Connection
```bash
adb devices
```
You should see your device listed.

### Step 3: Get Phone's IP Address
On your phone:
1. Go to **Settings** → **About phone** → **Status** → **IP address**
2. Or go to **Settings** → **WiFi** → Tap on connected network → Note the IP address

### Step 4: Set ADB to TCP/IP Mode
```bash
adb tcpip 5555
```

### Step 5: Disconnect USB Cable
You can now unplug the USB cable.

### Step 6: Connect via WiFi
```bash
adb connect <PHONE_IP>:5555
```
Example:
```bash
adb connect 192.168.1.100:5555
```

### Step 7: Verify Connection
```bash
adb devices
flutter devices
```

### Step 8: Run Your App
```bash
flutter run
```

---

## Troubleshooting

### Connection Failed
- Make sure both devices are on the same WiFi network
- Check if firewall is blocking the connection
- Try restarting ADB:
```bash
adb kill-server
adb start-server
```

### Device Not Showing in Flutter
```bash
flutter doctor
adb devices
```

### Reconnect After Phone Sleep
If connection drops after phone sleeps:
```bash
adb connect <PHONE_IP>:5555
```

### Switch Back to USB
```bash
adb usb
```

---

## Quick Commands Reference

```bash
# Check connected devices
adb devices
flutter devices

# Connect via WiFi
adb connect <IP>:5555

# Disconnect
adb disconnect

# Kill and restart ADB
adb kill-server
adb start-server

# Run Flutter app
flutter run

# Run with specific device
flutter run -d <device-id>
```

---

## Tips
- Keep your phone's screen on during development to prevent disconnection
- Use a static IP for your phone to avoid reconnecting
- The WiFi connection will persist until you restart your phone or turn off WiFi debugging
