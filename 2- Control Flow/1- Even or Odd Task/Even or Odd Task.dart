void main() {
  // Create a list of integers containing both even and odd numbers.
  List<int> numbersList = [1, 2, 4, -7, 0, 13, 18, 50, 75];

  // Generate a list of strings that represent the type (even/odd) of each number.
  List<String> numbersTypesList = numbersTypes(numbersList: numbersList);

  // Print both the list of numbers and their corresponding types.
  printTypes(numbersList: numbersList, numbersTypesList: numbersTypesList);
}

// Create a method that returns a list of strings representing the types (even/odd) of the provided numbers.
List<String> numbersTypes({required List<int> numbersList}) {
  // Initialize an empty list to store the types of the numbers.
  List<String> typeList = [];

  // Use a for-in loop to iterate over each number in the provided list.
  for (var number in numbersList) {
    // Add the type (even/odd) of the current number to the list.
    typeList.add(numberType(number: number));
  }

  // Return the updated list containing the types.
  return typeList;
}

// Create a method that takes an integer and returns whether it is 'Even' or 'Odd',
String numberType({required int number}) {
  /* Use a switch statement to check the remainder when dividing the number by 2
   and return 'Even' if the remainder is 0, otherwise return 'Odd'. */
  switch (number % 2) {
    case 0:
      return 'Even';
    default:
      return 'Odd';
  }
}

// Create a method that prints the numbers and their corresponding types.
void printTypes({
  required List<int> numbersList,
  required List<String> numbersTypesList,
}) {
  // Iterate over the indices of the lists and print each number with its type
  for (var i = 0; i < numbersList.length; i++) {
    print('Number: ${numbersList[i]} is ${numbersTypesList[i]}\n=====');
  }
}

////////////////////////////////////////////////////////////////////////////////
// A short and concise code.
// ////////////////////////////////////////////////////////////////////////////////
// void main() {
//   List<int> numbersList = [1, 2, 4, -7, 0, 13, 18, 50, 75];

//   for (var number in numbersList) {
//     print('Number: $number is ${number % 2 == 0 ? 'Even' : 'Odd'}\n=====');
//   }
// }
////////////////////////////////////////////////////////////////////////////////