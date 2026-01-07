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

  test('Multiple numbers separated by commas return sum', () {
    final calculator = StringCalculator();
    expect(calculator.add('1,2,3,4'), 10);
  });

  test('Newlines between numbers are allowed', () {
    final calculator = StringCalculator();
    expect(calculator.add('1\n2,3'), 6);
  });

  test('Supports custom delimiter defined in header', () {
    final calculator = StringCalculator();
    expect(calculator.add('//;\n1;2'), 3);
  });

  test('Negative numbers throw exception', () {
    final calculator = StringCalculator();
    expect(
          () => calculator.add('1,-2,3'),
      throwsA(
        predicate((e) =>
            e.toString().contains('negative numbers not allowed -2')),
      ),
    );
  });

}

