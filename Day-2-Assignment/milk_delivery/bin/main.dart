import 'dart:io';
import 'dart:math';
void main(List<String> arguments) {
  int x_classes;    //for classes of milk
  int packetDemand;
  int iterator,totalPackets;
  var packetList = List();
  stdout.write('Enter the no of classes of milk : ');
  x_classes = int.parse(stdin.readLineSync());
  print('Enter the no of milk packets in each class respectively');
  totalPackets=0;
  for(iterator=0;iterator<x_classes;iterator++){
    packetList.add(int.parse(stdin.readLineSync()));
    totalPackets += packetList.elementAt(iterator);
  }
  stdout.write('Enter the no of milk packets demanded in order delivery: ');
  packetDemand = int.parse(stdin.readLineSync());
  if(packetDemand>=totalPackets){
    print('Cannot deliver, only ${totalPackets-1} no of milk packets can be supplied');
    exit(0);
  }
  print('Thank you, your order of ${packetDemand} milk packets are accepted');
  var new_list = List.from(packetList);
  int index;
  var random = Random().nextInt((packetDemand/2).floor());
  var packetDelivered = packetDemand - random;
  while(packetDemand>0){
    index=0;
    for(iterator=1;iterator<x_classes;iterator++){
      if(new_list.elementAt(iterator)>new_list.elementAt(index)){
        index = iterator;
      }
    }
    if(new_list.elementAt(index)>packetDemand){
      new_list[index] -= packetDemand;
      packetDemand=0;
      break;
    }else{
      packetDemand -= new_list.elementAt(index);
      new_list[index] = 0;
    }
  }
  print('Available    Shipped      Remaining\n---------------------------------------------');
  for(iterator=0;iterator<x_classes;iterator++){
    print(' ${packetList[iterator]}\t\t${packetList[iterator]-new_list[iterator]}\t\t${new_list[iterator]}');
  }
  print('\n-\n-\n-\nNumber of packets spoiled during delivery :$random');
  print('Number of milk packets delivered finally : $packetDelivered');
}
