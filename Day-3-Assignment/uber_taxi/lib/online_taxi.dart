class OnlineTaxi{
  int initialFare = 40;   // per km for initial distance
  int initialDistance = 20; // in km
  int afterFair = 10;     // per km after initial distance
  int calculateFair(int distance){
    int fair;
    if(distance<=initialDistance){
      fair = distance*initialFare;
    } else{
      fair = initialDistance * initialFare + (distance - initialDistance) * afterFair;
    }
    return fair;
  }
} 