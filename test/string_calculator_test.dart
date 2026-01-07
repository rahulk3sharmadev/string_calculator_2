import 'package:test/test.dart';
import '../lib/string_calculator.dart';

void main() {
  test('Empty string returns 0', () {
    final calculator = StringCalculator();
    expect(calculator.add(''), 0);
  });

  test('Single number returns its value', () {
    final calculator = StringCalculator();
    expect(calculator.add('5'), 5);
  });

  test('Two numbers separated by comma return sum', () {
    final calculator = StringCalculator();
    expect(calculator.add('1,5'), 6);
  });
}

