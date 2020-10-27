import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Center(
            child: Text('Dicee'),
          ),
        ),
        body: DiceePage(),
        backgroundColor: Colors.red,
      ),
    ),
  );
}

class DiceePage extends StatefulWidget {
  @override
  _DiceePageState createState() => _DiceePageState();
}

class _DiceePageState extends State<DiceePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  Random rng = Random();

  void updateDice(bool left, bool right) {
    if (left) {
      this.leftDiceNumber = rng.nextInt(6) + 1;
    }
    if (right) {
      this.rightDiceNumber = rng.nextInt(6) + 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Row(
              children: [
                Expanded(
                  child: FlatButton(
                    child: Image.asset('assets/images/dice$leftDiceNumber.png'),
                    onPressed: () {
                      setState(() {
                        updateDice(true, false);
                      });
                    },
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    child:
                        Image.asset('assets/images/dice$rightDiceNumber.png'),
                    onPressed: () {
                      setState(() {
                        updateDice(false, true);
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: 60,
              child: RaisedButton(
                onPressed: () {
                  setState(() {
                    updateDice(true, true);
                  });
                },
                child: Text(
                  "Roll Dice",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                color: Colors.white,
                textColor: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
