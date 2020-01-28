import 'dart:io';
import 'dart:math';
void main(List<String> arguments) {
  int flag;
  int num;
  String coin;
  var random = Random();
  do{
    print('---Flipping the coin---\n---\n---');
    num = random.nextInt(2)+1;
    coin =  num==1 ? 'HEAD' : 'TAIL' ;
    print(coin);
    stdout.write('Enter 1 to again flip the coin and 0 to exit : ');
    flag = int.parse(stdin.readLineSync());
  }while(flag==1);
}