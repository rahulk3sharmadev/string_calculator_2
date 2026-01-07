class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    String delimiter = ',';
    String body = numbers;

    if (numbers.startsWith('//')) {
      final parts = numbers.split('\n');
      delimiter = parts[0].substring(2);
      body = parts[1];
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
