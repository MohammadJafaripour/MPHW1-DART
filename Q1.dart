class Guest {
  final String? name;
  final String? nickname;

  Guest({required this.name, required this.nickname});

  // اسم دلخواه اولویته؛ ?. و ?? کمک می‌کنن null رو رد کنیم و اصل اسم‌ها عوض نشه.
  // 'guest' یه اسم ثبت‌شده‌ست و بزرگ می‌شه؛ 'Guest' فقط جایگزین نبودن هر دو اسمه.
  String displayName() {
    return nickname?.toUpperCase() ?? name?.toUpperCase() ?? 'Guest';
  }
}

void main() {
  final guest = Guest(name: 'guest', nickname: null);
  print(guest.displayName());
}
