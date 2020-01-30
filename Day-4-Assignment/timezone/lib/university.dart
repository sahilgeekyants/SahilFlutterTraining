class University{
  String universityName = 'Indian International University';
  var branchCountries = ['INDIA','USA','GERMANY','AUSTRALIA','RUSSIA'];
  var countryTimeZoneUTC = {'INDIA':['+',5,30],
                              'USA':['-',6,0],
                              'GERMANY':['+',1,0],
                              'AUSTRALIA':['+',8,45],
                              'RUSSIA':['+',3,0]};      // 'INDIA':['+',5,30] means +05:30 UTC of INDIA
  var branches = {1:['INDIA','Bangalore',8,30,17,30],
                  2:['INDIA','Delhi',11,30,20,30],
                  3:['INDIA','Mumbai',13,30,22,30],
                  4:['USA','New York',9,30,18,30],
                  5:['USA','Houston',12,30,21,30],
                  6:['GERMANY','Berlin',8,30,17,30],
                  7:['GERMANY','Munich',11,30,20,30],
                  8:['GERMANY','Bonn',13,30,22,30],
                  9:['AUSTRALIA','Sydney',9,30,18,30],
                  10:['AUSTRALIA','Melbourne',12,30,21,30],
                  11:['RUSSIA','Moscow',8,30,17,30],
                  12:['RUSSIA','Saint Petersburg',13,30,22,30]};   // 'INDIA':[8,30,17,30] means open between -> 08:30 to 17:30
  void universityDetails(){
    print('We have following branches in different parts of the world');
    for(var entry in branches.entries){
      print('${entry.key}. ${entry.value.elementAt(1)} in ${entry.value.elementAt(0)}');
    }
  }
  int giveUtcValue(String country,int hours,int minutes){
    int utcHourValue;
    int utcMinuteValue;
    int finalUtcValue;
    var timeZone = countryTimeZoneUTC[country];
    if(timeZone.elementAt(0) == '+'){
      utcHourValue = (hours-timeZone.elementAt(1)) ;
      utcMinuteValue = (minutes - timeZone.elementAt(2));
    }else {
      utcHourValue = (hours+timeZone.elementAt(1)) ;
      utcMinuteValue = (minutes + timeZone.elementAt(2));
    }
    if(utcHourValue<0){
      if(utcMinuteValue<0){
        finalUtcValue = (utcHourValue*100)+utcMinuteValue ;
      } else {
        finalUtcValue = ((utcHourValue+1)*100)+(60-utcMinuteValue) ;
      }
    }
    else{
      if(utcMinuteValue<0){
        if(utcHourValue!=0){
          finalUtcValue = ((utcHourValue-1)*100)+(60+utcMinuteValue) ;
        }else{
          finalUtcValue = ((utcHourValue+1)*100)+(utcMinuteValue-60) ;
        }
      }else{
        finalUtcValue = (utcHourValue*100)+utcMinuteValue ;
      }
    }
    return finalUtcValue;
  }
  void currentlyOpenBranches(String country,int hours,int minutes){
    print('At $hours:$minutes ');
    for(var entry in branches.entries){
      if(giveUtcValue(entry.value.elementAt(0),entry.value.elementAt(2),entry.value.elementAt(3))<= 
        giveUtcValue(country, hours, minutes) &&
        giveUtcValue(country, hours, minutes) <=
        giveUtcValue(entry.value.elementAt(0),entry.value.elementAt(4),entry.value.elementAt(5)) ){
          print('${entry.value.elementAt(1)} - ${entry.value.elementAt(0)}');
        }
    }
  }
}