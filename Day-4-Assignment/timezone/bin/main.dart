import 'dart:io';
import 'package:timezone/university.dart';

void main(List<String> arguments) {
  var university = University();
  print('---Welcome to the ${university.universityName} Portal---');
  university.universityDetails();
  var currentTime = [0,0];
  var flag ;
  print('Default Time Zone is of India.\nYou can check which branches are open at which time.\n'); // time input 17:30 means 05:30 PM
  do {
    flag = true;
    stdout.write('Enter the time hours : ');
    currentTime[0] = int.parse(stdin.readLineSync());
    stdout.write('Enter the time minutes : ');
    currentTime[1] = int.parse(stdin.readLineSync());
    if(currentTime[0]<0 || currentTime[0]>24 || currentTime[1]<0 || currentTime[1]>60 ){
      print(' ${currentTime[0]}:${currentTime[1]} is not valid time\nPlease enter a valid time.');
      flag =false;
    }else{
      university.currentlyOpenBranches('INDIA', currentTime[0], currentTime[1]);
    }
  } while (!flag);
}
