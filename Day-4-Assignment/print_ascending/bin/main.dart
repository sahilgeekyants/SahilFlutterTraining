import 'dart:io';
void main(List<String> arguments) {
  var numbers = List();
  int sizeOfList;
  stdout.write('Enter the number of elements : ');
  sizeOfList = int.parse(stdin.readLineSync());
  print('Enter the ${sizeOfList} elements');
  for(var iterator = 0; iterator<sizeOfList;iterator++){
    numbers.add(int.parse(stdin.readLineSync()));
  }
  numbers.sort();
  print('--Elements in ascending order are--\n${numbers}');
}