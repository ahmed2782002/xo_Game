import 'package:flutter/material.dart';

class BoardButton extends StatelessWidget {
   BoardButton({super.key , required this.text , required this.index,required this.onButtonClicked});
   Function onButtonClicked;
   int? index;
 String text;
  @override
  Widget build(BuildContext context) {
    return
          Expanded(child:
          Container(
            margin: EdgeInsets.all(5),
            child: ElevatedButton(
              onPressed: () {
                onButtonClicked(index);
              },
              child: Text(
               text!,
                style: TextStyle(color: Colors.white , fontSize: 30),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)
                ),
              ),
            ),
          ),



    );
  }
}
