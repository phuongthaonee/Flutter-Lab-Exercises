class Story {
  final String storyTitle;
  final String choice1;
  final String choice2;
  final int choice1StoryNum;
  final int choice2StoryNum;

  Story({
    required this.storyTitle,
    required this.choice1,
    required this.choice2,
    required this.choice1StoryNum,
    required this.choice2StoryNum,
  });
}

class StoryBrain {
  int _storyNumber = 0;

  final List<Story> _storyData = [
    Story(
      storyTitle:
          'Bạn là sinh viên đang đi dạo trên phố cổ Hà Nội. Giữa những cửa hàng quen thuộc, bạn phát hiện một hiệu sách cổ kính mà trước đây chưa từng thấy. Biển hiệu ghi "Thư Viện Thời Gian". Ánh sáng vàng ấm áp tỏa ra từ bên trong.',
      choice1: 'Bước vào hiệu sách để khám phá',
      choice2: 'Bỏ qua và tiếp tục đi',
      choice1StoryNum: 1,
      choice2StoryNum: 2,
    ),

    Story(
      storyTitle:
          'Bên trong hiệu sách, hàng nghìn cuốn sách cổ xếp chồng lên nhau. Một ông lão với bộ râu bạc trắng đang ngồi đọc sách. Ông nhìn bạn và mỉm cười: "Ta đã đợi người đến đây. Người có duyên với một cuốn sách đặc biệt."',
      choice1: 'Hỏi ông lão về cuốn sách đặc biệt',
      choice2: 'Tự mình khám phá giá sách',
      choice1StoryNum: 3,
      choice2StoryNum: 4,
    ),

    Story(
      storyTitle:
          'Bạn quyết định không vào. Ngày hôm sau, khi quay lại, hiệu sách đã biến mất như chưa từng tồn tại. Bạn tự hỏi liệu đó có phải là một cơ hội đã lỡ mất? Cuộc sống tiếp tục bình thường, nhưng trong lòng luôn có một chút tiếc nuối.\n\n🔚 KẾT THÚC - Cái kết: Cơ hội bỏ lỡ\n\nBài học: Đôi khi sự thận trọng quá mức khiến ta bỏ lỡ những điều kỳ diệu.',
      choice1: 'Chơi lại',
      choice2: '',
      choice1StoryNum: -1,
      choice2StoryNum: -1,
    ),

    Story(
      storyTitle:
          'Ông lão đưa cho bạn một cuốn sách da cũ kỹ có tên "Nhật Ký Thời Gian". "Cuốn sách này cho phép người đọc du hành về quá khứ một lần duy nhất. Nhưng hãy cẩn thận, mọi thay đổi trong quá khứ đều ảnh hưởng đến hiện tại. Người có dám dùng nó không?"',
      choice1: 'Chấp nhận cuốn sách và sử dụng nó',
      choice2: 'Từ chối vì sợ hậu quả',
      choice1StoryNum: 5,
      choice2StoryNum: 6,
    ),

    Story(
      storyTitle:
          'Bạn lang thang giữa các giá sách và tìm thấy một cuốn sách phát sáng màu xanh. Khi chạm vào, bạn cảm thấy một luồng năng lượng kỳ lạ. Bên trong có một tấm bản đồ dẫn đến kho báu bị mất từ thời Lý. Bạn có thể giàu có hoặc làm điều đúng đắn.',
      choice1: 'Theo bản đồ đi tìm kho báu cho bản thân',
      choice2: 'Đưa bản đồ cho Viện Khảo cổ học',
      choice1StoryNum: 7, // Greed path
      choice2StoryNum: 8, // Altruism path → ending
    ),

    // ========== LEVEL 3A: TIME TRAVEL DILEMMA ==========
    // CoT: Power accepted → Past revealed → Personal stakes → Ultimate choice
    // Pattern: Intervention vs Non-intervention paradox
    Story(
      storyTitle:
          'Bạn mở cuốn sách và thấy mình đứng ở Hà Nội năm 1954. Bạn nhận ra rằng bạn có thể ngăn chặn một tai nạn sẽ xảy ra với ông nội của mình khi ông còn trẻ. Nhưng ông lão đã cảnh báo: "Thay đổi quá khứ có thể xóa bỏ chính bạn khỏi hiện tại."',
      choice1: 'Cứu ông nội, thay đổi lịch sử gia đình',
      choice2: 'Không can thiệp, để mọi thứ diễn ra tự nhiên',
      choice1StoryNum: 9,
      choice2StoryNum: 10,
    ),

    Story(
      storyTitle:
          'Bạn từ chối cuốn sách. Ông lão gật đầu tán thành: "Người có trí tuệ thật sự. Không phải ai cũng đủ mạnh mẽ để từ chối quyền năng." Ông tặng bạn một cuốn sách triết học quý giá. Bạn rời đi với bài học: Sức mạnh thật sự là biết khi nào nên nói không.\n\n🔚 KẾT THÚC - Cái kết: Người khôn ngoan\n\nBài học: Trí tuệ là biết giới hạn của mình và không vượt qua nó.',
      choice1: 'Chơi lại',
      choice2: '',
      choice1StoryNum: -1,
      choice2StoryNum: -1,
    ),

    Story(
      storyTitle:
          'Bạn theo bản đồ đến một ngôi đền cổ ở ngoại thành. Bên trong, bạn tìm thấy một rương vàng lấp lánh. Nhưng khi mở ra, một lời nguyền được kích hoạt. Bạn cảm thấy cơ thể mình dần biến thành đá. Trên rương có dòng chữ Hán cổ - có thể là thần chú phá giải!',
      choice1: 'Cố gắng đọc thần chú trên rương để phá lời nguyền',
      choice2: 'Chấp nhận số phận và ăn năn về lòng tham',
      choice1StoryNum: 11,
      choice2StoryNum: 12,
    ),

    Story(
      storyTitle:
          'Bạn đưa bản đồ cho Viện Khảo cổ học Việt Nam. Họ tìm thấy kho báu và nó trở thành di sản quốc gia quan trọng. Bạn được vinh danh là người có công phát hiện. Bạn cảm thấy tự hào vì đã làm điều đúng đắn cho đất nước, giá trị này vượt xa bất kỳ của cải vật chất nào.\n\n🔚 KẾT THÚC - Cái kết: Anh hùng dân tộc\n\nBài học: Giá trị thật sự nằm ở việc đóng góp cho cộng đồng, không phải sở hữu cá nhân.',
      choice1: 'Chơi lại',
      choice2: '',
      choice1StoryNum: -1,
      choice2StoryNum: -1,
    ),

    Story(
      storyTitle:
          'Bạn cứu ông nội. Khi trở về hiện tại, bạn phát hiện mọi thứ đã thay đổi hoàn toàn. Gia đình bạn giờ rất giàu có, nhưng bạn không còn nhận ra chính mình. Ký ức của bạn về quá khứ cũ dần mờ nhạt. Bạn đứng trước lựa chọn cuối cùng: chấp nhận hay tìm cách quay lại?',
      choice1: 'Chấp nhận thực tại mới và quên quá khứ',
      choice2: 'Cố gắng tìm cách quay về dòng thời gian cũ',
      choice1StoryNum: 13,
      choice2StoryNum: 14,
    ),

    Story(
      storyTitle:
          'Bạn quyết định không can thiệp. Khi trở về hiện tại, mọi thứ vẫn như cũ. Bạn hiểu rằng đôi khi không hành động cũng là một lựa chọn đúng đắn. Bạn trân trọng cuộc sống hiện tại của mình hơn bao giờ hết, vì bạn đã thấy được giá trị của nó.\n\n🔚 KẾT THÚC - Cái kết: Người quan sát\n\nBài học: Đôi khi sức mạnh lớn nhất là biết khi nào không nên hành động.',
      choice1: 'Chơi lại',
      choice2: '',
      choice1StoryNum: -1,
      choice2StoryNum: -1,
    ),

    Story(
      storyTitle:
          'Bạn đọc thần chú bằng tiếng Hán cổ với tất cả sự tập trung. Lời nguyền được phá vỡ! Nhưng kho báu biến mất theo. Bạn nhận ra rằng tri thức mới là kho báu thực sự. Bạn trở thành một nhà nghiên cứu về văn hóa cổ đại, cuộc đời bạn có ý nghĩa hơn bất kỳ của cải nào.\n\n🔚 KẾT THÚC - Cái kết: Tri thức là vàng\n\nBài học: Kiến thức và sự phát triển bản thân có giá trị hơn của cải vật chất.',
      choice1: 'Chơi lại',
      choice2: '',
      choice1StoryNum: -1,
      choice2StoryNum: -1,
    ),

    Story(
      storyTitle:
          'Bạn không thể phá lời nguyền. Cơ thể bạn hoàn toàn hóa đá và trở thành một bức tượng trong ngôi đền. Nhiều năm sau, du khách đến đây và tự hỏi về câu chuyện của bức tượng bí ẩn này. Lòng tham đã biến bạn thành một lời cảnh báo cho hậu thế.\n\n🔚 KẾT THÚC - Cái kết: Lòng tham bị trừng phạt\n\nBài học: Lòng tham không chỉ phá hủy tâm hồn mà còn có thể phá hủy cả con người.',
      choice1: 'Chơi lại',
      choice2: '',
      choice1StoryNum: -1,
      choice2StoryNum: -1,
    ),

    Story(
      storyTitle:
          'Bạn chấp nhận cuộc sống mới. Dần dần, bạn quên đi quá khứ cũ và hòa nhập vào thực tại này. Bạn sống một cuộc đời sung túc với mọi thứ bạn từng mơ ước. Nhưng đôi khi, trong những giấc mơ mơ hồ, bạn vẫn cảm thấy như thiếu mất điều gì đó quan trọng mà bạn không thể nhớ ra.\n\n🔚 KẾT THÚC - Cái kết: Thực tại mới\n\nBài học: Đôi khi những gì ta được có thể không bù đắp được những gì ta mất.',
      choice1: 'Chơi lại',
      choice2: '',
      choice1StoryNum: -1,
      choice2StoryNum: -1,
    ),

    Story(
      storyTitle:
          'Bạn quay lại hiệu sách để tìm ông lão. Ông nói: "Người đã chọn thay đổi, giờ phải chịu hậu quả." Nhưng ông cho bạn một cơ hội cuối: quên đi mọi thứ và sống trong thực tại mới, hoặc nhớ mãi nhưng không bao giờ thuộc về nơi nào. Bạn chọn nhớ, và trở thành người lang thang giữa hai thế giới, mãi mãi tìm kiếm một nơi gọi là nhà.\n\n🔚 KẾT THÚC - Cái kết: Kẻ lang thang thời gian\n\nBài học: Một số quyết định không thể đảo ngược, và ta phải sống với hậu quả mãi mãi.',
      choice1: 'Chơi lại',
      choice2: '',
      choice1StoryNum: -1,
      choice2StoryNum: -1,
    ),
  ];

  String getStory() {
    return _storyData[_storyNumber].storyTitle;
  }

  String getChoice1() {
    return _storyData[_storyNumber].choice1;
  }

  String getChoice2() {
    return _storyData[_storyNumber].choice2;
  }

  bool isEnding() {
    return _storyData[_storyNumber].choice1StoryNum == -1;
  }

  void makeChoice1() {
    if (!isEnding()) {
      _storyNumber = _storyData[_storyNumber].choice1StoryNum;
    }
  }

  void makeChoice2() {
    if (!isEnding()) {
      _storyNumber = _storyData[_storyNumber].choice2StoryNum;
    }
  }

  void restart() {
    _storyNumber = 0;
  }
}
