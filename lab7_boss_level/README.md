# lab7_boss_level

Mô tả
Ứng dụng truyện phiêu lưu tương tác (Choose Your Own Adventure). Người chơi đọc đoạn văn và chọn 1 trong 2 hướng đi. Câu chuyện dẫn đến kết thúc khác nhau tùy vào lựa chọn.

Kiến thức đạt được
- Graph-based data structure: mỗi Story node là một đỉnh, lựa chọn là cạnh có hướng
- Index-based navigation: di chuyển giữa các node bằng chỉ số trong List
- Xử lý Ending state đặc biệt (sentinel value -1)
- Tổ chức dữ liệu phi tuyến tính trong Dart List

Cấu trúc file
lib/
├── main.dart          ← entry point + StoryPage UI
└── story_brain.dart   ← Story model + StoryBrain graph logic