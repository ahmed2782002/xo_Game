
import 'package:flutter/material.dart';

import 'board_button.dart';

class GameBoard extends StatefulWidget {
  GameBoard({super.key});
  static const String routeName = "GameBoard";
  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  List<String>? boardState = [
    '', '', '',
    '', '', '',
    '', '', '',
  ];
  int counter = 0;
  int player1 = 0;
  int player2 = 0;
  void onButtonClick (int index){
    if(boardState![index].isNotEmpty){
      return ;
    }
    if(counter % 2 == 0){
      boardState![index] = "X";
    }else {
      boardState![index] = "O";
    }
    counter++;
    if(checkWinner('X') ){
    player1 +=5;
    initBoard() ;

    }else if(checkWinner('O')){
player2+=5;
initBoard() ;
    }else if (counter == 9){
      initBoard() ;
    }
    setState(() {

    });
  }
  bool checkWinner (String symbol){
for(int i = 0; i < 9 ; i+=3){
  if (boardState![i]== symbol && boardState![i+1]==symbol && boardState![i+2]==symbol) {
    return true;
  }
}
for (int i=0 ; i < 3 ; i++){
  if (boardState![i]== symbol && boardState![i+3]==symbol && boardState![i+6]==symbol) {
    return true;
  }
}

  if (boardState![0]== symbol && boardState![4]==symbol && boardState![8]==symbol) {
    return true;
  }
if (boardState![2]== symbol && boardState![4]==symbol && boardState![6]==symbol) {
  return true;
}

return false;

  }
  void initBoard ( ){
    boardState = [
      '', '', '',
      '', '', '',
      '', '', '',
    ];
    counter = 0 ;
  }
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as GameBoardArgs;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme:IconThemeData(color: Colors.white) ,
        backgroundColor: Colors.blue,
        title: Text(
          "XO Game",

          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${args.player1Name} (X)",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "$player1",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${args.player2Name} (O)",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "$player2",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(text: boardState![0], index: 0, onButtonClicked: onButtonClick,),
                BoardButton(text: boardState![1], index: 1,onButtonClicked: onButtonClick,),
                BoardButton(text: boardState![2], index: 2,onButtonClicked: onButtonClick,),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(text: boardState![3], index: 3,onButtonClicked: onButtonClick,),
                BoardButton(text: boardState![4], index: 4,onButtonClicked: onButtonClick,),
                BoardButton(text: boardState![5], index: 5,onButtonClicked: onButtonClick,),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(text: boardState![6], index: 6,onButtonClicked: onButtonClick,),
                BoardButton(text: boardState![7], index: 7,onButtonClicked: onButtonClick,),
                BoardButton(text: boardState![8], index: 8,onButtonClicked: onButtonClick,),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
class GameBoardArgs {
  String player1Name;
  String player2Name;
  GameBoardArgs({required this.player1Name,  required this.player2Name});


}
