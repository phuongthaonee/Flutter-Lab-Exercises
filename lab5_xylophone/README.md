# lab5_xylophone

Mô tả
- Ứng dụng đàn mộc cầm với 7 phím màu sắc (đỏ → tím theo màu cầu vồng). Nhấn mỗi phím phát ra âm thanh nhạc tương ứng.

Kiến thức đạt được
- Thêm và sử dụng pub package (audioplayers) - quy trình pubspec.yaml → flutter pub get → import
- Nguyên tắc DRY (Don't Repeat Yourself): tạo buildKey() helper function thay vì copy-paste 7 lần
- Expanded bên trong Column để mỗi phím chiếm đúng 1/7 chiều cao màn hình
- AssetSource để phát file âm thanh từ assets
