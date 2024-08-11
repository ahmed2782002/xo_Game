import 'package:flutter/material.dart';
import 'package:tic_tac_toe/game_board.dart';
import 'package:tic_tac_toe/player_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
 debugShowCheckedModeBanner: false,
      initialRoute: PlayerScreen.routeName,
      routes: {
   GameBoard.routeName : (_) => GameBoard(),
        PlayerScreen.routeName : (_) => PlayerScreen(),
      },

    );
  }
}
