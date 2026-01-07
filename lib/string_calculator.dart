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

    return normalized
        .split(delimiter)
        .map(int.parse)
        .fold(0, (sum, n) => sum + n);
  }
}
