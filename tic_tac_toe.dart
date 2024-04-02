import "dart:io";

bool winnerx = false;
bool winner0 = false;
bool playerXturn = true;

void printBoard(board){
  print("""\n
 | ${board[0]} | ${board[1]} | ${board[2]} | \n
 | ${board[3]} | ${board[4]} | ${board[5]} | \n
 | ${board[6]} | ${board[7]} | ${board[8]} | \n
""");
}

void checkWinner(board){
  if ((board[0] == 'x' && board[2] == 'x' && board[2] == 'x')
    ||(board[0] == 'x' && board[3] == 'x' && board[6] == 'x')
    ||(board[3] == 'x' && board[4] == 'x' && board[5] == 'x')
    ||(board[1] == 'x' && board[4] == 'x' && board[7] == 'x')
    ||(board[6] == 'x' && board[7] == 'x' && board[8] == 'x')
    ||(board[2] == 'x' && board[5] == 'x' && board[8] == 'x')
    ||(board[0] == 'x' && board[4] == 'x' && board[8] == 'x')
    ||(board[2] == 'x' && board[4] == 'x' && board[6] == 'x')){
    print('player x won!!!');
    winnerx = true;
  }
  else if ((board[0] == '0' && board[2] == '0' && board[2] == '0')
    ||(board[0] == '0' && board[3] == '0' && board[6] == '0')
    ||(board[3] == '0' && board[4] == '0' && board[5] == '0')
    ||(board[1] == '0' && board[4] == '0' && board[7] == '0')
    ||(board[6] == '0' && board[7] == '0' && board[8] == '0')
    ||(board[2] == '0' && board[5] == '0' && board[8] == '0')
    ||(board[0] == '0' && board[4] == '0' && board[8] == '0')
    ||(board[2] == '0' && board[4] == '0' && board[6] == '0')){
    print('player 0 won!!!');
    winner0 = true;
  }
}

dynamic input(board){
  if(playerXturn &&(winnerx == false || winner0 == false)){
    print("Player x input your position: ");
    int? movex = int.parse(stdin.readLineSync()!);
    board[movex - 1] = 'x';
    playerXturn = false;
  }
  else if(!playerXturn &&(winnerx == false || winner0 == false)){
    print("Player 0 input your position: ");
    int? move0 = int.parse(stdin.readLineSync()!);
    board[move0 - 1] = '0';
    playerXturn = true;
  }
  return board;
}

void main(){
  print("Welcome to my tic tac toe game:");
  List<String> board = ['', '', '', '', '', '', '', '', ''] ;
  printBoard(board);
  checkWinner(board);
  while(winner0 == false || winnerx == false){
    board =  input(board);
    printBoard(board);
  }
}