import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final int fillColor;
  final int textColor;
  final Function callback;

  const CalculatorButton({
    required this.text,
    required this.fillColor,
    required this.textColor,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(7),
      child: SizedBox(
        width: 80,
        height: 80,
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0)
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 28,
            ),
          ),
          onPressed: () => callback(text),
          color: Color(fillColor),
          textColor: Color(textColor),
        ),
      ),
    );
  }
}