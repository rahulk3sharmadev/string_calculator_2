class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    List<String> delimiters = [','];
    String body = numbers;

    if (numbers.startsWith('//')) {
      final headerAndBody = numbers.split('\n');
      final header = headerAndBody[0];
      body = headerAndBody[1];

      final matches = RegExp(r'\[(.*?)\]').allMatches(header);
      if (matches.isNotEmpty) {
        delimiters = matches.map((m) => m.group(1)!).toList();
      } else {
        delimiters = [header.substring(2)];
      }
    }

    // Normalize newlines
    body = body.replaceAll('\n', delimiters.first);

    // Build regex to split by any delimiter
    final pattern = RegExp(delimiters.map(RegExp.escape).join('|'));
    final values = body.split(pattern).map(int.parse).toList();

    final negatives = values.where((n) => n < 0).toList();
    if (negatives.isNotEmpty) {
      throw Exception(
        'negative numbers not allowed ${negatives.join(',')}',
      );
    }

    return values
        .where((n) => n <= 1000)
        .fold(0, (sum, n) => sum + n);
  }
}
