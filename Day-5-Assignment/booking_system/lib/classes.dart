abstract class Customer{
  String name,phoneNo,email,street,city,state,postalCode,country;
  Customer(this.name,this.email,this.phoneNo,this.street,this.city,this.state,this.postalCode,this.country);
  Map getCustomerDetails(){
    return {'name':name,'phoneNo':phoneNo,'email':email,'Address':
              {'street':street,'city':city,'state':state,'postalCode':postalCode,'country':country}};
  }
}

abstract class Airline{
  String sourceAirport,destinationAirport;
  void getAirlineTravelDetails();
}

abstract class Bus{
  String sourceBusStop,destinationBusStop;
  void getBusTravelDetails();
}

abstract class Railway{
  String sourceRailwayStation,destinationRailwayStation;
  void getRailwayTravelDetails();
}

class BookingPlatform extends Customer implements Airline,Bus,Railway{ 
  int _bookingMedium;
  @override
  String sourceAirport,destinationAirport;
  @override
  String sourceBusStop,destinationBusStop;
  @override
  String sourceRailwayStation,destinationRailwayStation;

  BookingPlatform.AirRoute({this.sourceAirport,this.destinationAirport,String name,String phoneNo,String email,String street,String city,
                          String state,String postalCode,String country}) : super(name,phoneNo,email,street,city,state,postalCode,country){
    _bookingMedium = 1;
  }

  BookingPlatform.BusRoute({this.sourceBusStop,this.destinationBusStop,String name,String phoneNo,String email,String street,String city,
                          String state,String postalCode,String country}) : super(name,phoneNo,email,street,city,state,postalCode,country){
    _bookingMedium = 2;
  }

  BookingPlatform.RailRoute({this.sourceRailwayStation,this.destinationRailwayStation,String name,String phoneNo,String email,String street,String city,
                          String state,String postalCode,String country}) : super(name,phoneNo,email,street,city,state,postalCode,country){
    _bookingMedium = 3;
  }

  Map getBookingDetails(){
    if(_bookingMedium == 1){return getAirlineTravelDetails();}
    else if(_bookingMedium == 2){return getBusTravelDetails();}
    else if(_bookingMedium == 3){return getRailwayTravelDetails();}
    return null;
  }

  @override
  Map getAirlineTravelDetails() {
    return {'Medium':'Airlines','Source':sourceAirport,'Destination':destinationAirport,'Person Details':super.getCustomerDetails()};
  }

  @override
  Map getBusTravelDetails() {
    return {'Medium':'Bus','Source':sourceBusStop,'Destination':destinationBusStop,'Person Details':super.getCustomerDetails()};
  }
  
  @override
  Map getRailwayTravelDetails() {
    return {'Medium':'Railways','Source':sourceRailwayStation,'Destination':destinationRailwayStation,'Person Details':super.getCustomerDetails()};
  }
}