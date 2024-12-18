void main() {
  List<int> numbers = [1, 5, 3, 10, 50, -2, 130, 24];

  print('=====\nOriginal List: $numbers');
  print('Minimum Number: ${minimumNumber(numbers: numbers)}\n=====');
}

int minimumNumber({required List<int> numbers}) {
  int mini = numbers.first;

  // Get the mini with normal for loop.
//   for (var i = 0; i < numbers.length; i++) {
//     if (numbers[i] < mini) mini = numbers[i];
//   }

  // Get the mini with for-in loop.
//   for (var number in numbers) {
//     if (number < mini) mini = number;
//   }

  // Get the mini with forEach loop.
  numbers.forEach((number) {
    if (number < mini) mini = number;
  });

  return mini;
}


////////////////////////////////////////////////////////////////////////////////
// A short and concise code.
////////////////////////////////////////////////////////////////////////////////
// void main() {
//   List<int> numbers = [1, 5, 3, 10, 50, -2, 130, 24];
//   print('=====\nOriginal List: $numbers');

//   numbers.sort();
//   print('Minimum Number: ${numbers.first}\n=====');
// }
////////////////////////////////////////////////////////////////////////////////