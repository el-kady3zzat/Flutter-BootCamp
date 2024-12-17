# Number Analyzer

This Dart program analyzes an integer to determine if it is:
1. **Positive**, **Negative**, or **Zero**.
2. **Even** or **Odd**.

## Features
- **Input**: Any integer (hardcoded in the `number` variable).
- **Output**: A single line indicating the number's positivity/negativity and parity (even/odd).

## Code Structure
- **`positiveOrNegative`**:
  - A function that checks if the number is:
    - `Zero` (when `number == 0`),
    - `Positive` (when `number > 0`),
    - `Negative` (when `number < 0`).
- **`oddOrEven`**:
  - A function that checks if the number is:
    - `Even` (when `number % 2 == 0`),
    - `Odd` (otherwise).

## Example Output



## Highlights
- Clean and modular design with reusable functions.
- Compact use of Dart's ternary operator for concise logic.

