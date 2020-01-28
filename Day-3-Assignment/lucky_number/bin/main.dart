import 'dart:io';
import 'dart:math';
void main(List<String> arguments) {
  int flag;
  int num;
  var quote_list = ['Always be Happy','Beautiful day ahead','Evening will be wonderful today'
  ,'Weather is good','Be happy for this moment. This moment is your life.'
  ,'Adopt the pace of nature: Her secret is patience.','Enjoy your day','It may rain today'
  ,'Action may not always bring happiness, but there is no happiness without action.'
  ,'The harder you work, the luckier you get'];
  var random = Random();
  do{
    num = random.nextInt(10)+1;
    print('The lucky number : ${num}');
    stdout.write('${quote_list.elementAt(num-1)}\n\nEnter 1 to again generate the lucky number and 0 to exit : ');
    flag = int.parse(stdin.readLineSync());
  }while(flag==1);
}
