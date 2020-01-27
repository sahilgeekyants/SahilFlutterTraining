import 'dart:io';
import 'Product.dart';
import 'RegistrationForm.dart';
import 'Address.dart';
void main(List<String> arguments) {
  var p1;
  int i,n;
  //Task-1
  print('Task-1\n');
  p1=Product('Washing Machine', 35000,10);
  p1.getProductDetails();
  
  //Task-2
  print('\nTask-2\n---Entring details of the person---\nEnter name, age, email, phone no respectively.');
  p1 = RegistrationForm(stdin.readLineSync(),int.parse(stdin.readLineSync()),stdin.readLineSync(),stdin.readLineSync());
  p1.getDetails();

  //Task-3
  print('\nTask-3\n---Enter the address of the user---');
  p1 = Address(stdin.readLineSync());
  p1.intoUpperCase();

  //Task -4
  print('\nTask-4\n---Enter any number to print its table---');
  n = int.parse(stdin.readLineSync());
  print('Table is :');
  for(i=1;i<=10;i++)
  {
    stdout.write(n*i);
    if(i!=10){
      stdout.write(',');
    }
  }

  //Task-5
  print('\n\nTask-5\n---Enter the number series---');
  var list = stdin.readLineSync().codeUnits.toList();
  list.sort((a,b) => b.compareTo(a));
  print('Biggest number of the series : ${String.fromCharCodes(list)}');
}