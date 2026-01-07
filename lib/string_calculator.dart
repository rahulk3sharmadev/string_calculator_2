class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    String delimiter = ',';
    String body = numbers;

    if (numbers.startsWith('//')) {
      final headerAndBody = numbers.split('\n');
      final header = headerAndBody[0];
      body = headerAndBody[1];

      if (header.contains('[') && header.contains(']')) {
        delimiter = header.substring(
          header.indexOf('[') + 1,
          header.indexOf(']'),
        );
      } else {
        delimiter = header.substring(2);
      }
    }

    final normalized = body.replaceAll('\n', delimiter);
    final values = normalized.split(delimiter).map(int.parse).toList();

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
