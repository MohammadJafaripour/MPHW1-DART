class QueueBoard {
  final int start;
  final int count;

  QueueBoard({required this.start, required this.count});

  // Future یه مقدار می‌ده؛ await صبر می‌کنه دریافت غیرهمگامش تموم بشه.
  Future<int> loadStart() async {
    await Future.delayed(Duration(seconds: 0));
    return start;
  }

  // برخلاف Future، جریان چند مقدار می‌ده؛ async* و yield هر شماره رو جدا منتشر می‌کنن.
  // await ترتیب رو حفظ می‌کنه و با count صفر، حلقه هیچ رویدادی نمی‌فرسته.
  Stream<int> announcements() async* {
    final firstNumber = await loadStart();
    for (var i = 0; i < count; i++) {
      await Future.delayed(Duration(seconds: 0));
      yield firstNumber + i;
    }
  }
}

Future<void> main() async {
  await for (final number in QueueBoard(start: 7, count: 0).announcements()) {
    print(number);
  }
}
