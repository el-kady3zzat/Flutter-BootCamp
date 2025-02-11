// Abstract class (interface)
abstract class Payment {
  void payAmount(double amount);
}

class CashPayment implements Payment {
  @override
  void payAmount(double amount) {
    print('Pay $amount by Cash');
  }
}

class CreditPayment implements Payment {
  @override
  void payAmount(double amount) {
    print('Pay $amount using Credit');
  }
}

class User {
  final Payment _payment;

  // Inject the Payment abstract class
  User(this._payment);

  void checkout(double amount) {
    _payment.payAmount(amount);
  }
}
