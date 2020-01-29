import 'dart:io';
import 'package:shopping_mall/billing_counter.dart';
void main(List<String> arguments) {
  print('---Billing Counter---');
  stdout.write('Enter the number of queues : ');
  var queueNumbers = int.parse(stdin.readLineSync());
  var billingCounter = BillingCounter();
  int iterator;
  print('Enter the size of ${queueNumbers} queues');
  for(iterator=0;iterator < queueNumbers;iterator++){
    billingCounter.insertQueue(int.parse(stdin.readLineSync()));
  }
  billingCounter.showQueues();
  int operation ; 
  do {
    print('\nOperations --\n\t1. Add new customer in shortest queue\n\t2. Add another queue\n\t3. Remove any queue');
    print('\t4. Remove customer from any queue\n\t5. Exit');
    stdout.write('Enter the operation number you want to perform :');
    operation = int.parse(stdin.readLineSync());
    if (operation==1) {
      billingCounter.addCustomer();
    }else if(operation==2) {
      queueNumbers++;
      stdout.write('Enter the size of queue no ${queueNumbers} : ');
      billingCounter.insertQueue(int.parse(stdin.readLineSync()));
      billingCounter.showQueues();
    }else if(operation==3) {
      if(queueNumbers<1){
        print('Counter is already empty');
      }
      else{
        int deleteQueueNumber;
        do {
          stdout.write('Enter the queue no to be removed : ');
          deleteQueueNumber = int.parse(stdin.readLineSync());
          if(deleteQueueNumber>=1 && deleteQueueNumber<=queueNumbers){
            billingCounter.removeQueue(deleteQueueNumber);
            queueNumbers--;
            billingCounter.showQueues();
            break;
          }
          else{
            print('-invalid queue number-');
          }
        } while (true);
      }
      
    }else if(operation==4) {
      if(queueNumbers<1){
        print('Counter is already empty');
      }
      else{
        int deleteQueueNumber;
        do {
          stdout.write('Enter the queue no  : ');
          deleteQueueNumber = int.parse(stdin.readLineSync());
          if(deleteQueueNumber>=1 && deleteQueueNumber<=queueNumbers){
            billingCounter.removeCustomer(deleteQueueNumber);
            break;
          }
          else{
            print('-invalid queue number-');
          }
        } while (true);
      }
    }
  } while (operation!=5);
}
