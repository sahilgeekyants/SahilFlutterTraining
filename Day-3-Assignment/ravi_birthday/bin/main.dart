/*Rav’is birthday is in Jan month. This time he is planning to invite 31 of his friends.He wants 
to distribute some chocolates to all of his friends after party. He went to a shop to buy 
a packet of chocolates.At chocolate shop, each packet is having different number of chocolates. 
He wants to buy such a packet which contains number of chocolates, which can be distributed 
equally among all of his friends.Help Ravi to buy such a packet. */
import 'dart:io';
void main(List<String> arguments) {
  var ravi_frnds = 31;
  int chok_in_packet;
  stdout.write('Enter the no of chocolates in the packet : ');
  chok_in_packet = int.parse(stdin.readLineSync());
  if(chok_in_packet > 0 && chok_in_packet % ravi_frnds == 0){
    print('Yes, Ravi can buy this packet of chocolates.');
  } else{
    print('No, Ravi can-not buy this packet of chocolates.');
  }
}
