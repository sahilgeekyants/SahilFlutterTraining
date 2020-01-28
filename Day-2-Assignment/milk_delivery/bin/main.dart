import 'dart:io';
void main(List<String> arguments) {
  int x;    //for classes of milk
  int m;
  int i,sum;
  var n_list = List();
  stdout.write('Enter the no of classes of milk : ');
  x = int.parse(stdin.readLineSync());
  print('Enter the no of milk packets in each class respectively');
  sum=0;
  for(i=0;i<x;i++){
    n_list.add(int.parse(stdin.readLineSync()));
    sum += n_list.elementAt(i);
  }
  stdout.write('Enter the no of milk packets demanded in order delivery: ');
  m = int.parse(stdin.readLineSync());
  if(m>=sum){
    print('Cannot deliver, only ${sum-1} no of milk packets can be supplied');
    exit(0);
  }
  print('Thank you, your order of ${m} milk packets are accepted');
  var new_list = List.from(n_list);
  int index;
  while(m>0){
    index=0;
    for(i=1;i<x;i++){
      if(new_list.elementAt(i)>new_list.elementAt(index)){
        index = i;
      }
    }
    if(new_list.elementAt(index)>m){
      new_list[index] -= m;
      m=0;
      break;
    }else{
      m -= new_list.elementAt(index);
      new_list[index] = 0;
    }
  }
  for(i=0;i<x;i++){
    print('${n_list[i]}\t${n_list[i]-new_list[i]}\t${new_list[i]}');
  }
}
