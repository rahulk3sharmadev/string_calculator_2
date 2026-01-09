# String Calculator Kata (TDD)

This repository contains an implementation of the **String Calculator Kata** using **Test Driven Development (TDD)**.

The purpose of this exercise is to demonstrate **test-first development**, **incremental design**, and **clean business logic**, not UI or framework usage.

---

## Problem Statement

Create a simple string calculator with the following method signature:

```dart
int add(String numbers);
```

### Rules

- An empty string returns 0
- A single number returns its value
- Two or more numbers return their sum
- Numbers may be separated by commas or newlines
- Custom delimiters are supported
- Negative numbers are not allowed
- Numbers greater than 1000 are ignored

---

## Supported Features & Examples

| Feature | Input | Output |
|---------|-------|--------|
| Empty input | `""` | `0` |
| Single number | `"5"` | `5` |
| Multiple numbers | `"1,2,3"` | `6` |
| Newline delimiter | `"1\n2,3"` | `6` |
| Custom delimiter | `"//;\n1;2"` | `3` |
| Multi-character delimiter | `"//[***]\n1***2***3"` | `6` |
| Multiple delimiters | `"//[*][%]\n1*2%3"` | `6` |
| Ignore numbers > 1000 | `"2,1001"` | `2` |
| Negative numbers | `"1,-2,-5"` | Exception |
| Empty values | `"1,,3"` | `4` |
| Invalid input | `"1,a,3"` | Exception |

---

## TDD Approach

This solution strictly follows the **Red → Green → Refactor** cycle.

### Process

**RED**
Write a failing test describing new behavior

**GREEN**
Write the minimum code required to pass the test

**REFACTOR**
Improve code structure without changing behavior

Each feature was implemented incrementally with small, focused commits clearly labeled:
- `RED: ...`
- `GREEN: ...`
- `REFACTOR: ...`

This commit history provides verifiable evidence of test-first development.

---

## Project Structure

This is a pure Dart project with no UI and no framework scaffolding.

```
string_calculator/
├── lib/
│   └── string_calculator.dart
├── test/
│   └── string_calculator_test.dart
├── pubspec.yaml
├── README.md
```

---

## Running the Tests
### Test Results
00:00 +12: All tests passed!


### Prerequisites

Dart SDK version 2.17 or higher

### Install dependencies

```bash
dart pub get
```

### Run tests

```bash
dart test
```

---

## Why No UI / Flutter?

The assessment explicitly focuses on:

- Business logic
- Unit testing
- TDD discipline

UI components and platform scaffolding were intentionally excluded to keep the repository:
- Minimal
- Focused
- Easy to review

---

## Commit Strategy

Each requirement follows this pattern:

1. One commit introducing a failing test (RED)
2. One commit implementing the behavior (GREEN)
3. Optional refactor commits (REFACTOR)

This allows reviewers to trace the evolution of functionality step by step.

---

## Author

**Rahul Sharma**

GitHub: https://github.com/rahulk3sharmadev

---

## Notes

This implementation prioritizes:

- Clarity over cleverness
- Explicit tests over assumptions
- Maintainability over brevity