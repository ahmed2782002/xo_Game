import 'package:flutter/material.dart';
import 'package:tic_tac_toe/game_board.dart';

class PlayerScreen extends StatelessWidget {
  PlayerScreen({super.key});
  static const String routeName = "PlayerScreen";

  final _formKey = GlobalKey<FormState>();
  final TextEditingController player1Controller = TextEditingController();
  final TextEditingController player2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text(
          "Welcome to Tic Tac Toe Game",
          style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(50)),
          height: 700,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: player1Controller,
                    decoration: InputDecoration(
                      label: Text("Player 1 Name"),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Player 1 name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: player2Controller,
                    decoration: InputDecoration(
                      label: Text("Player 2 Name"),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Player 2 name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 60),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        Navigator.of(context).pushNamed(
                          GameBoard.routeName,
                          arguments: GameBoardArgs(
                            player1Name: player1Controller.text,
                            player2Name: player2Controller.text,
                          ),
                        );
                      }
                    },
                    child: Text(
                      "Let's Play",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
