# lab6_quizzler

Mô tả
- Ứng dụng đố vui True/False với 10+ câu hỏi thú vị. Người chơi chọn đúng/sai, app track lịch sử bằng row icon ✅❌, và hiển thị màn hình kết quả sau câu hỏi cuối.

Kiến thức đạt được
- Separation of Concerns: tách QuizBrain (logic + data) hoàn toàn khỏi UI Widget
- Navigator.push() và Navigator.pop() - điều hướng giữa các màn hình
- Dynamic List of Widgets: List<Icon> scoreKeeper tăng dần theo câu trả lời
- Callback function truyền từ parent xuống child (VoidCallback onRestart)
- Tổ chức project nhiều file: main.dart, quiz_brain.dart, score_page.dart

Cấu trúc file
lib/

├── main.dart         ← entry point + QuizPage UI

├── quiz_brain.dart   ← Question model + QuizBrain logic

└── score_page.dart   ← màn hình kết quả
