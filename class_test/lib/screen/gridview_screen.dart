import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class GridViewScreen extends StatefulWidget {
  @override
  _GridViewScreenState createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {
  List<String> buttonLetters = ['s', 'u', 'b', 'h', 'a', 's', 'h'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView subhash'),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        children: buttonLetters.map((letter) {
          return MyButton(
            letter: letter,
            onPressed: () {
              setState(() {
                buttonLetters.remove(letter);
              });
            },
          );
        }).toList(),
      ),
    );
  }
}

class MyButton extends StatefulWidget {
  final String letter;
  final Function() onPressed;

  MyButton({required this.letter, required this.onPressed});

  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  int _clickCount = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _clickCount++;
          if (_clickCount >= 2) {
            _clickCount = 0; // Reset click count
            widget.onPressed(); // Remove the button
          }
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: _clickCount == 1 ? Colors.green : Colors.blue,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Text(
            widget.letter,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
