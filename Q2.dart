extension ListX<T> on List<T> {
  // خروجی nullable هست چون لیست خالی عضوی نداره؛ 0 و 'Empty' خودشون عضو معتبرن.
  T? firstOrNull() {
    return isEmpty ? null : first;
  }
}

class GiftBox<T> {
  final List<T> items;

  GiftBox(this.items);

  // T توی کلاس و اکستنشن نوع عضو رو نگه می‌داره؛ خوندن عضو هم لیست رو عوض نمی‌کنه.
  // خروجی اینجا هم nullable می‌مونه تا خالی بودن جعبه مشخص باشه.
  T? firstGift() {
    return items.firstOrNull();
  }
}

void main() {
  final box = GiftBox<String>(['Empty', 'Mug']);
  print(box.firstGift());
}
