# lab8_bmi_calculator

Mô tả
- Ứng dụng tính chỉ số BMI với giao diện dark mode chuyên nghiệp. Người dùng chọn giới tính, điều chỉnh chiều cao bằng Slider, tăng/giảm cân nặng và tuổi, rồi xem kết quả phân loại BMI.
Công thức: BMI = weight(kg) / height(m)²
Kết quảPhân loạiBMI < 18.5Underweight18.5 – 24.9Normal ✅BMI ≥ 25Overweight

Kiến thức đạt được
- Custom Widget (RoundIconButton) - tạo widget tái sử dụng trong file riêng
- Design system (constants.dart) - tập trung màu sắc và text style
- Slider widget và callback onChanged
- SnackBar — hiển thị thông báo tạm thời (validation khi chưa chọn giới tính)
- enum Gender - quản lý state có nhiều hơn 2 trạng thái
- Navigator.push() với truyền dữ liệu qua constructor

Cấu trúc file

lib/

├── main.dart                ← entry point

├── constants.dart           ← màu sắc và text style constants

├── calculator_brain.dart    ← logic tính BMI

├── round_icon_button.dart   ← custom reusable widget

├── input_page.dart          ← màn hình nhập liệu

└── result_page.dart         ← màn hình kết quả BMI
