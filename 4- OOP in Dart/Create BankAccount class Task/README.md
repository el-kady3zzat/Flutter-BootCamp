# Bank Account Management Program

This Dart program simulates basic bank account operations, including deposits, withdrawals, and account initialization.

## Features
- **Account Creation**:
  - Supports creating accounts with either a default balance of `0.0` or an initial balance provided at the time of creation.
- **Deposit Operations**:
  - Allows depositing a positive amount into the account.
  - Rejects deposits with non-positive values.
- **Withdrawal Operations**:
  - Allows withdrawing an amount if it is positive and within the available balance.
  - Provides error messages for insufficient balance or invalid withdrawal amounts.
- **Account Info Display**:
  - Displays the account ID and current balance.

## Code Structure
- **`BankAccount` Class**:
  - Contains attributes `accountId` and `balance`.
  - Provides two constructors:
    - **Default Constructor**: Initializes the balance to `0.0`.
    - **With Initial Balance Constructor**: Initializes the balance to a given value.
  - Includes methods for deposits (`deposit`), withdrawals (`withdraw`), and displaying account information (`displayAccountInfo`).

- **`outputScenario` Function**:
  - Simulates deposit and withdrawal scenarios to demonstrate program functionality.

## Example Scenarios
### Scenario 1: Creating account with initial balance
![NamedConstructorOutput](https://github.com/user-attachments/assets/4c8cccf6-1470-461d-afa6-0c7d35389aed)

### Scenario 2: Creating account with default constructor
![DefaultConstructorOutput](https://github.com/user-attachments/assets/c3d81bf2-4376-4273-b502-a56460a7da13)

## Highlights
- Demonstrates the use of constructors, conditional statements, and object-oriented programming in Dart.
- Provides user-friendly feedback for invalid operations.
