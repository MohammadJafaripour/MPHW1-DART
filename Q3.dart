class Poster {
  final int id;
  final String? title;
  final int likes;

  Poster({required this.id, required this.title, required this.likes});

  // مدل فقط داده رو تبدیل می‌کنه؛ null هم داده‌ست و final جلوی تغییر فیلدها رو می‌گیره.
  factory Poster.fromJson(Map<String, dynamic> json) {
    return Poster(
      id: json['id'] as int,
      title: json['title'] as String?,
      likes: json['likes'] as int,
    );
  }

  // همون دادهٔ اصلی رو پس می‌دیم تا عنوان null با عنوان واقعی 'Untitled' قاطی نشه.
  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'likes': likes};
  }
}

class PosterFormatter {
  // متن جایگزین فقط برای نمایشه؛ این کلاس دادهٔ مدل رو تغییر نمی‌ده.
  String displayTitle(Poster poster) {
    return poster.title ?? 'Untitled';
  }
}

void main() {
  final poster = Poster.fromJson({'id': 12, 'title': 'Untitled', 'likes': 0});
  print(PosterFormatter().displayTitle(poster));
  print(poster.toJson()['title']);
}
