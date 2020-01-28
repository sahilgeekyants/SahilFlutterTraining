/*  -1 -> empty
     1 -> player1 represented by 'x'
     0 -> player2 represented by 'o'  */
class Game{
  var gameEntries;
  Game(){                        // this list represent game entries of both players
    gameEntries = List<int>.filled(9, -1,growable: false);
  }
  bool checkWinner(int zeroX){    // here zeroX is either 0 or 1
    return ((gameEntries[0]==zeroX && gameEntries[1]==zeroX && gameEntries[2]==zeroX) ||
            (gameEntries[3]==zeroX && gameEntries[4]==zeroX && gameEntries[5]==zeroX) ||
            (gameEntries[6]==zeroX && gameEntries[7]==zeroX && gameEntries[8]==zeroX) ||
            (gameEntries[0]==zeroX && gameEntries[3]==zeroX && gameEntries[6]==zeroX) ||
            (gameEntries[1]==zeroX && gameEntries[4]==zeroX && gameEntries[7]==zeroX) ||
            (gameEntries[2]==zeroX && gameEntries[5]==zeroX && gameEntries[8]==zeroX) ||
            (gameEntries[0]==zeroX && gameEntries[4]==zeroX && gameEntries[8]==zeroX) ||
            (gameEntries[2]==zeroX && gameEntries[4]==zeroX && gameEntries[6]==zeroX));
  }
  bool isEmpty(int location){       // location can be 1 to 9
    return (gameEntries[location-1] == -1);
  }
  void makeEntryPlayer1(int location){       // location can be 1 to 9
    if(isEmpty(location)){
        gameEntries[location-1] = 1;
    }
  }
  void makeEntryPlayer2(int location){       // location can be 1 to 9
    if(isEmpty(location)){
        gameEntries[location-1] = 0;
    }
  }
  String checkSpace(int gameEntryValue){
    if(gameEntryValue == 1){
      return 'x';
    } else if(gameEntryValue == 0){
      return 'o';
    } else {
      return ' ';
    }
  }
  void show(){
    print('\n ${checkSpace(gameEntries[0])}|${checkSpace(gameEntries[1])}|${checkSpace(gameEntries[2])}');
    print('-------\n ${checkSpace(gameEntries[3])}|${checkSpace(gameEntries[4])}|${checkSpace(gameEntries[5])}');
    print('-------\n ${checkSpace(gameEntries[6])}|${checkSpace(gameEntries[7])}|${checkSpace(gameEntries[8])}\n');
  }
  
}