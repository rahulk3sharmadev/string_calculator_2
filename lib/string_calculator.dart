class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    final parts = numbers.split(',');
    if (parts.length == 1) {
      return int.parse(parts[0]);
    }

    return parts
        .map(int.parse)
        .reduce((sum, n) => sum + n);
  }
}
