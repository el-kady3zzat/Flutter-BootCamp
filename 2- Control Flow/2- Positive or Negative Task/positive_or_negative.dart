void main() {
  // Define a number to check for positivity/negativity and even/odd.
  int number = 12;

  // Print the result by combining the outputs of positiveOrNegative() and oddOrEven() functions.
  print(
    'Number: $number is ${positiveOrNegative(number: number)} and ${oddOrEven(number: number)}',
  );
}

// Method to check if a number is positive, negative, or zero.
String positiveOrNegative({required int number}) {
  /* Return 'Zero' if the number is 0,
     'Positive' if the number is greater than 0,
     or 'Negative' if the number is less than 0.*/
  return number == 0
      ? 'Zero'
      : number > 0
          ? 'Positive'
          : 'Negative';
}

// Method to check if a number is even or odd.
String oddOrEven({required int number}) {
  // Return 'Even' if the number is divisible by 2,
  // otherwise return 'Odd'.
  return number % 2 == 0 ? 'Even' : 'Odd';
}


////////////////////////////////////////////////////////////////////////////////
// A short and concise code.
////////////////////////////////////////////////////////////////////////////////
// void main() {
//   int number = 12;
//   print(
//     'Number: $number is ${number.isNegative ? 'Negative' : 'Positive'} and ${number.isEven ? 'Even' : 'Odd'}',
//   );
// }
////////////////////////////////////////////////////////////////////////////////