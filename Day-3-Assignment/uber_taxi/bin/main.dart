import 'dart:io';
import 'package:uber_taxi/classic_taxi.dart';
import 'package:uber_taxi/online_taxi.dart';
void main(List<String> arguments) {
  int distance;
  stdout.write('Enter the distance you want to travel( in km) : ');
  distance = int.parse(stdin.readLineSync());
  var onlineTaxi = OnlineTaxi();
  var classicTaxi = ClassicTaxi();
  if(onlineTaxi.calculateFair(distance) <= classicTaxi.calculateFair(distance)){
    print('Go for Online Taxi.');
  } else{
    print('Go for Classic Taxi.');
  }
}
