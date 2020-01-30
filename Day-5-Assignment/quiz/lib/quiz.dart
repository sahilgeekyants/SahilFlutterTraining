import 'dart:math';
class Quiz{
  var countryCapitals = {'India':'New Delhi','Afghanistan':'Kabul','France':'Paris',
  'Japan':'Tokyo','Nepal':'Kathmandu','Russia':'Moscow','China':'Beijing',
  'Germany':'Berlin','England':'London','Thailand':'Bangkok'};
  var random = Random();
  int randomNum ;
  void showCountries(){
    print('-List of Countries-\n');
    for(var entry in countryCapitals.keys){
      print(entry);
    }
  }
  String askQuestion(){
    randomNum = random.nextInt(10) ;
    print('\nWhat is the capital of ${countryCapitals.keys.elementAt(randomNum)}');
    return countryCapitals.keys.elementAt(randomNum);
  }
  bool evaluateAnswer(String country, String answer){
    return (countryCapitals[country].toLowerCase() == answer.toLowerCase());
  }
}