class ClassicTaxi{
  int initialFare = 30;     // per km for initial distance
  int initialDistance = 20; // in km
  int afterFair = 15;       // per km after initial distance
  int speed = 80;           // in km per hour
  int baseFair = 15;
  int fairPerMinute = 15;   
  int calculateFair(int distance){
    int fair;
    if(distance<=initialDistance){
      fair = distance*initialFare;
    } else{
      fair = initialDistance * initialFare + (distance - initialDistance) * afterFair;
      fair += baseFair + fairPerMinute * (distance - initialDistance)*60~/speed;   // base fair and timing changes after initial distance
    }
    return fair;
  }
}