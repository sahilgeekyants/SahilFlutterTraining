import 'dart:io';
import 'classes.dart';
class Handler{
  int _count;
  Map _personDetail;
  int _travelMedium;
  Map _route;
  Map<int,BookingPlatform> bookings;
  Handler(){
    _count = 0;
    bookings = Map<int,BookingPlatform>();
  }
  void begin(){
    print('-----Welcome to Travel Agency-----');
    var bookAgain = 'n';
    do{
      print('---For new Booking---');
      addNewBooking();
      stdout.write('\n Do you want to make a new booking (y/n) : ');
      bookAgain = stdin.readLineSync();
    } while(bookAgain == 'y' || bookAgain == 'Y');
  }
  void addNewBooking(){
    _personDetail =  setCustomerdetails();
    stdout.write('--Choose your travel medium--\n1. Airline\t2. Bus\t3. Railway\nEnter the no. alongwith anyone option : ');
    _travelMedium = int.parse(stdin.readLineSync());
    _route = setSourceDestination();
    if(_travelMedium == 1){
      bookings[++_count] = BookingPlatform.AirRoute(sourceAirport:_route['Source'], destinationAirport:_route['Destination'], 
                              name:_personDetail['name'], phoneNo:_personDetail['phoneNo'], email:_personDetail['email'], 
                              street:_personDetail['Address']['street'], city:_personDetail['Address']['city'], state:_personDetail['Address']['state'], 
                              postalCode:_personDetail['Address']['postalCode'], country:_personDetail['Address']['country']);
    } else if(_travelMedium == 2){
      bookings[++_count] = BookingPlatform.BusRoute(sourceBusStop:_route['Source'], destinationBusStop:_route['Destination'], 
                              name:_personDetail['name'], phoneNo:_personDetail['phoneNo'], email:_personDetail['email'], 
                              street:_personDetail['Address']['street'], city:_personDetail['Address']['city'], state:_personDetail['Address']['state'], 
                              postalCode:_personDetail['Address']['postalCode'], country:_personDetail['Address']['country']);
    } else if(_travelMedium == 3){
      bookings[++_count] = BookingPlatform.RailRoute(sourceRailwayStation:_route['Source'], destinationRailwayStation:_route['Destination'], 
                              name:_personDetail['name'], phoneNo:_personDetail['phoneNo'], email:_personDetail['email'], 
                              street:_personDetail['Address']['street'], city:_personDetail['Address']['city'], state:_personDetail['Address']['state'], 
                              postalCode:_personDetail['Address']['postalCode'], country:_personDetail['Address']['country']);
    }
  }
  void showBookings(){
    print('-----List of Bookings-----\n');
    for(var entry in bookings.entries){
      print('${entry.key}.  ${entry.value.getBookingDetails().toString()}');
    }
  }
  Map setCustomerdetails(){
    String name,phoneNo,email,street,city,state,postalCode,country;
    stdout.write('Enter your details first---\nEnter your Name : ');
    name = stdin.readLineSync();
    stdout.write('Enter your Phone Number : ');
    phoneNo = stdin.readLineSync();
    stdout.write('Enter your  Email: ');
    email = stdin.readLineSync();
    stdout.write('\nNow Enter Your Complete Address----\n Street : ');
    street = stdin.readLineSync();
    stdout.write(' City : ');
    city = stdin.readLineSync();
    stdout.write(' State : ');
    state = stdin.readLineSync();
    stdout.write(' Postal Code  : ');
    postalCode = stdin.readLineSync();
    stdout.write(' Country  : ');
    country = stdin.readLineSync();
    return {'name':name,'phoneNo':phoneNo,'email':email,'Address':
              {'street':street,'city':city,'state':state,'postalCode':postalCode,'country':country}};
  }
  Map setSourceDestination(){
    String source,destination;
    stdout.write('Enter your route details---\nEnter the source city : ');
    source = stdin.readLineSync();
    stdout.write('Enter the destination city :');
    destination = stdin.readLineSync();
    return {'Source':source,'Destination':destination};
  }
}