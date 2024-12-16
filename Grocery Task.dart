void main() {
  //create a final double variable to store the tax value.
  final double tax = .10;

  //create a list of maps to store the grocery items.
  List<Map<String, dynamic>> groceryItems = [
    {"name": "Tomatoes", "price": 10.0},
    {"name": "Potatoes", "price": 15.0},
    {"name": "Cucumbers", "price": 20.0},
    {"name": "Carrots", "price": 12.5},
  ];

  //get the total price.
  double totalPrice = calcTotalPrice(groceryItems: groceryItems);

  //print final price.
  printFinalPrice(totalPrice: totalPrice, tax: tax);
}

//This method is used to calculate the total price of the items.
double calcTotalPrice({required List<Map<String, dynamic>> groceryItems}) {
  //create a double variable to store the total prices.
  double totalPrice = 0.0;

  //create a for-in loop to calc the prices and update the totalPrice variable.
  for (var item in groceryItems) {
    totalPrice += item['price'] as double;
  }

  //return the total price.
  return totalPrice;
}

void printFinalPrice({required double totalPrice, required double tax}) {
  //calc the final price after adding the tax.
  double finalPrice = totalPrice + (totalPrice * tax);

  print('=====\nTotal Price = $totalPrice\n=====');
  print('=====\nTax = ${totalPrice * tax}\n=====');
  print(
      '=====\nFinal Price = $totalPrice + ${totalPrice * tax} = $finalPrice\$\n=====');
}
