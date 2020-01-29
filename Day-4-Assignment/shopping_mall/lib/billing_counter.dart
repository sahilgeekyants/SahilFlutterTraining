import 'dart:io';
class BillingCounter{
  List<int> queueList;
  int listSize;
  BillingCounter(){
    queueList = List();
  }
  void rearrange(){

  }
  void insertQueue(int queueSize){
    queueList.add(queueSize);
  }
  void removeQueue(int queueNumber){
    queueList.removeAt(queueNumber-1);
  }
  void showQueues(){
    listSize = numOfQueues();
    print('---Queues on the billing counter ---\n');
    int index;
    stdout.write('Queue No->  \t');
    for(index =0; index<listSize;index++){
      stdout.write('   ${index+1}');
    }
    print('\n-----------------------------------------');
    stdout.write('Queue Size->\t');
    for(index =0; index<listSize;index++){
      stdout.write('   ${queueList.elementAt(index)}');
    }
    print('');
  }
  void addCustomer(){
    if(numOfQueues()==0){
      print('Sorry! No queue available on the billing counter');
      return;
    }
    listSize = numOfQueues();
    var smallestQueueIndex = 0;
    for(var index=1;index<listSize;index++){
      if(queueList.elementAt(smallestQueueIndex)>=queueList.elementAt(index)){
        smallestQueueIndex = index;
      }
    }
    print('New customer will be added in queue no - ${smallestQueueIndex+1}');
    queueList[smallestQueueIndex]++;
    showQueues();
  }
  void removeCustomer(int queueNumber){
    if(queueList[queueNumber-1]==0){
      print('Queue no. ${queueNumber} is already empty.');
    }
    else{
      queueList[queueNumber-1]--;
      showQueues();
    }
  }
  int numOfQueues(){
    return queueList.length;
  }
}