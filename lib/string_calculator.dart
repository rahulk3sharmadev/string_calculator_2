class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    final normalized = numbers.replaceAll('\n', ',');
    return normalized
        .split(',')
        .map(int.parse)
        .fold(0, (sum, n) => sum + n);
  }
}
