# lab9_clima

Mô tả
- Ứng dụng thời tiết thực tế sử dụng GPS để lấy vị trí hiện tại và gọi OpenWeatherMap API để hiển thị thông tin thời tiết. Người dùng cũng có thể tìm kiếm thời tiết của bất kỳ thành phố nào.

Kiến thức đạt được
- REST API - HTTP GET request và parse JSON response
- geolocator package - xin quyền và lấy tọa độ GPS
- async/await + Future - lập trình bất đồng bộ trong Dart
- await Navigator.push() - nhận dữ liệu trả về từ màn hình con
- initState() - chạy logic ngay khi Widget khởi tạo
- Service layer pattern - tách biệt HTTP, GPS, và business logic

Cấu trúc file

lib/

├── main.dart

├── screens/

│   ├── loading_screen.dart    ← lấy GPS + gọi API, hiển thị loading

│   ├── location_screen.dart   ← hiển thị thời tiết hiện tại

│   └── city_screen.dart       ← tìm kiếm thành phố

└── services/

    ├── location.dart          ← geolocator wrapper
    
    ├── networking.dart        ← HTTP GET helper
    
    ├── weather.dart           ← parse API, emoji mapper
    
    └── api_key.dart

    
