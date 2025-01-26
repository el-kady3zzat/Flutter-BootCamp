# Number Categorizer

This Dart program categorizes a list of integers into "Even" or "Odd" and prints the results.

## Features
- **Input**: A predefined list of integers containing both even and odd numbers.
- **Processing**:
  - Iterates through the list and determines if each number is "Even" or "Odd" using a `switch` statement.
  - Handles edge cases, such as treating `0` as "Even."
- **Output**: Prints each number alongside its type (e.g., "Number: 2 is Even").

## Code Structure
- **`numbersTypes`**: Iterates through the list of numbers and returns a list of their types (Even/Odd).
- **`numberType`**: Uses a `switch` statement to check whether a number is "Even" or "Odd."
- **`printTypes`**: Prints the numbers and their corresponding types in a formatted manner.

## Example Output
Number: 1 is Odd
=====
Number: 2 is Even
=====
Number: 0 is Even


## Highlights
This program demonstrates:
- Clean, modular code design.
- Basic usage of lists, loops, and conditional logic in Dart.
