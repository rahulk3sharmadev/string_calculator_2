import 'package:test/test.dart';
import '../lib/string_calculator.dart';

void main() {
  var calculator;

  setUp(() {
    calculator=StringCalculator();
  },);

  group("Basic input", () {
    test('Empty string returns 0', () {
      expect(calculator.add(''), 0);
    });

    test('Single number returns its value', () {
      expect(calculator.add('5'), 5);
    });

    test('Two numbers separated by comma return sum', () {
      expect(calculator.add('1,5'), 6);
    });

    test('Multiple numbers separated by commas return sum', () {
      expect(calculator.add('1,2,3,4'), 10);
    });
  },);
  
  group("delimiter handling", () {
    test('Newlines between numbers are allowed', () {
      expect(calculator.add('1\n2,3'), 6);
    });

    test('Supports custom delimiter defined in header', () {
      expect(calculator.add('//;\n1;2'), 3);
    });
  },);

  group("other validations", () {
    test('Negative numbers throw exception', () {
      expect(
            () => calculator.add('1,-2,3'),
        throwsA(
          predicate((e) =>
              e.toString().contains('negative numbers not allowed -2')),
        ),
      );
    });

    test('Numbers greater than 1000 are ignored', () {
      expect(calculator.add('2,1001'), 2);
      expect(calculator.add('1000,1'), 1001);
    });

    test('Supports multi-character delimiter', () {
      expect(calculator.add('//[***]\n1***2***3'), 6);
    });

    test('Supports multiple delimiters', () {
      expect(calculator.add('//[*][%]\n1*2%3'), 6);
    });

    test('Empty values between delimiters are ignored', () {
      expect(calculator.add('1,,3'), 4);
    });

    test('Invalid input throws format exception', () {
      expect(() => calculator.add('1,a,3'), throwsFormatException);
    });
  },);





}

