class Letter {
  final int id;
  final String? sender;

  Letter({required this.id, required this.sender});

  // نامه فقط اسم نمایشی رو می‌سازه؛ null با 'Guest' نمایش داده می‌شه ولی داده عوض نمی‌شه.
  String displaySender() {
    return sender ?? 'Guest';
  }
}

class Result<T> {
  final T? data;
  final String? error;

  Result.success(this.data) : error = null;
  Result.failure(this.error) : data = null;
}

abstract class Repository<T> {
  Future<List<T>> getAll();
}

class LetterRepository implements Repository<Letter> {
  final List<Letter> letters;

  LetterRepository({required this.letters});

  // Repository قرارداد دریافت داده‌ست و این کلاس نامه‌ها رو می‌ده؛ Future دریافت رو غیرهمگام می‌کنه.
  @override
  Future<List<Letter>> getAll() async {
    return letters;
  }

  // await صبر می‌کنه فهرست آماده بشه؛ Result موفقیت یا خطا رو بدون چاپ نگه می‌داره.
  // فقط آرشیو خالی خطاست؛ نامشخص بودن نویسنده، خود نامه رو ناموجود نمی‌کنه.
  Future<Result<Letter>> firstLetter() async {
    final allLetters = await getAll();
    if (allLetters.isEmpty) {
      return Result<Letter>.failure('Archive Empty');
    }
    return Result<Letter>.success(allLetters.first);
  }
}

Future<void> main() async {
  final repository = LetterRepository(
    letters: [Letter(id: 7, sender: 'Guest')],
  );
  final result = await repository.firstLetter();
  print(result.data?.displaySender() ?? result.error);
}
