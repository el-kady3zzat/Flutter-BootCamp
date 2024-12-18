void main() {
  print('============================');

  // Creating account with initial balance
  print('Account with Initial Balance');
  BankAccount account = BankAccount.withInitialBalance('ACC002', 1000.0);

//   // Creating account with default constructor
//   print('Default Constructor');
//   BankAccount account = BankAccount('A123');

  print('============================');
  account.displayAccountInfo();
  outputScenario(account);
}

void outputScenario(BankAccount account) {
// Scenario 1: Deposit operations
  print('\nScenario 1: Deposit Operations');
  account.deposit(1000);
  account.deposit(-100);
  account.displayAccountInfo();

  // Scenario 2: Withdrawal operations
  print('\nScenario 2: Withdrawal Operations');
  account.withdraw(600.0);
  account.withdraw(500.0);
  account.withdraw(-50.0);
  account.displayAccountInfo();
}

class BankAccount {
  String accountId;
  double balance;

  // First constructor (with accountID)
  BankAccount(this.accountId) : balance = 0;

  // Second constructor (with accountID and initial balance)
  BankAccount.withInitialBalance(this.accountId, this.balance);

  // Withdraw method
  void withdraw(double amount) {
    // Checks if the amount is Positive
    if (amount <= 0) return print('Error: Withdrawal amount must be positive.');

    // Checks if the balance is sufficient
    if (amount > balance)
      return print('Error: Insufficient balance. Withdrawal failed.');

    // Perform withdrawal
    balance -= amount;
    print('Withdrawal of \$$amount successful. Remaining balance: \$$balance');
  }

  // Deposit method
  void deposit(double amount) {
    // Check if deposit amount is positive
    if (amount <= 0) return print('Error: Deposit amount must be positive.');

    // Perform deposit
    balance += amount;
    print('Deposit of \$$amount successful. New balance: \$$balance');
  }

  // Display account information method
  void displayAccountInfo() {
    print('=====\nYour Account Id: $accountId');
    print('Your Balance: $balance\n=====');
  }
}
