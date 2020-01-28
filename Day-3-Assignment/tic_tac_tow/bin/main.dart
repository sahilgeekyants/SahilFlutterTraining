import 'dart:io';
import 'package:tic_tac_tow/game.dart';
void main(List<String> arguments) {
  var game = Game();
  print('--Welcome to the Tic-Tac-Tow Game--');
  print('\nx\t->\tPlayer1\no\t->\tPlayer2\n');
  print('To make the move, just enter the valid location (1 to 9) in your turn');
  print('\n 1|2|3\n-------\n 4|5|6\n-------\n 7|8|9\n');
  print('---Game Start---');
  var winner = -1;
  var totalEntries = 0;
  int locationEntry;
  bool emptyCheck;
  do{
    stdout.write('Player1 enter the location : ');
    do{
        locationEntry = int.parse(stdin.readLineSync());
        emptyCheck = game.isEmpty(locationEntry);
        if(emptyCheck){
          game.makeEntryPlayer1(locationEntry);
          totalEntries++;
        }else{
          stdout.write('Player1 Please enter the valid location : ');
        }
    } while(!emptyCheck);
    game.show();
    if(game.checkWinner(1)){
      winner = 1;
      break;
    }
    if(totalEntries == 9){
      break;
    }
    stdout.write('Player2 enter the location : ');
    do{
        locationEntry = int.parse(stdin.readLineSync());
        emptyCheck = game.isEmpty(locationEntry);
        if(emptyCheck){
          game.makeEntryPlayer2(locationEntry);
          totalEntries++;
        }else{
          stdout.write('Player2 Please enter the valid location : ');
        }
    } while(!emptyCheck);
    game.show();
    if(game.checkWinner(0)){
      winner = 0;
      break;
    }
  }while(totalEntries<9);
  if(winner == 1){
    print('Player1 won the game');
  }else if(winner == 0){
    print('Player2 won the game');
  }else{
    print('Game Draw');
  }
}
