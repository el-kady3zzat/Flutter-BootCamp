# Number Analyzer

This Dart program analyzes an integer to determine if it is:
1. **Positive** or **Negative**.
2. **Even** or **Odd**.

## Features
- **Input**: Any integer.
- **Output**: A single line indicating the number's positivity/negativity and parity (even/odd).

## Code Structure
- **`positiveOrNegative`**:
  - A method that checks if the number is:
    - `Zero` (when `number == 0`),
    - `Positive` (when `number > 0`),
    - `Negative` (when `number < 0`).
- **`oddOrEven`**:
  - A method that checks if the number is:
    - `Even` (when `number % 2 == 0`),
    - `Odd` (otherwise).

## Example Output
![Output](https://github.com/user-attachments/assets/f35b4e56-a281-43d2-8c5a-57ecb5abd40b)


## Highlights
- Clean and modular design with reusable functions.
- Compact use of Dart's ternary operator for concise logic.

