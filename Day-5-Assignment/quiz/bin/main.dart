import 'dart:io';
import 'package:quiz/quiz.dart';

void main(List<String> arguments) {
  print('---Welcome to the Quiz---');
  var quiz = Quiz();
  quiz.showCountries();
  var flag = true;
  String randomCountry;
  String answer;
  do {
    randomCountry = quiz.askQuestion();
    
    do{
      answer = stdin.readLineSync();
      if(quiz.evaluateAnswer(randomCountry, answer)){
        print('Correct Answer 👍');
        flag = true;
      }else {
        print('Wrong Answer  👎  Please Try Again');
        flag = false;
      }
    } while(!flag);
    stdout.write('Do you want to continue (y/n) : ');
    answer = stdin.readLineSync();
  } while (answer == 'y' || answer == 'Y');
}
