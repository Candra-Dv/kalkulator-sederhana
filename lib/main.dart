import 'package:flutter/material.dart';
import 'package:kalkulator_sederhana/kalButton.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  String result = "0";
  String textToDislay = '';
  String expression = '';
  double textToDislayFsize = 38.0;
  double resultFsize = 48.0;

  void btnOnClick(String btnVal){
    setState(() {

      if(btnVal == "AC"){
        textToDislay = '';
        result = "0";
        textToDislayFsize = 38.0;
        resultFsize = 48.0;
      }

      else if(btnVal == "⌫"){
        textToDislay = textToDislay.substring(0, textToDislay.length - 1);
        if(textToDislay == ''){
          textToDislay = '';
        }

      }else if(btnVal == "="){

        expression = textToDislay;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');
        expression = expression.replaceAll('%', '/100');
        expression = expression.replaceAll(RegExp(r"([.]*0)(?!.*\d)"), '');

        try{
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        }catch(e){
          result = "Error";
        }

      }else{
        if(textToDislay == ''){
          textToDislay = btnVal;
        }else {
          textToDislay = textToDislay + btnVal;
        }
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kalkulator sederhana',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: Scaffold(
        backgroundColor: const Color(0xFFFFFCEF),
        appBar: AppBar(
          title: const Text('Kalkulator'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Text(
                  textToDislay,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: textToDislayFsize,
                  ),
                ),
              ),
              alignment: const Alignment(1.0, 1.0),
            ),
            Container(
              child: Padding(
                padding:const EdgeInsets.all(12),
                child: Text(
                  result,
                  style: TextStyle(
                    fontSize: resultFsize,
                  ),
                ),
              ),
              alignment: const Alignment(1.0, 1.0),
            ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButton(
                text: 'AC',
                fillColor: 0xFFF44336,
                textColor: 0xFFFFFFFF,
                callback: btnOnClick,
              ),
              CalculatorButton(
                text: '⌫',
                fillColor: 0xFFF44336,
                textColor: 0xFFFFFFFF,
                callback: btnOnClick,
              ),
              CalculatorButton(
                text: '%',
                fillColor: 0xFFFF9800,
                textColor: 0xFFFFFFFF,
                callback: btnOnClick,
              ),
              CalculatorButton(
                text: '÷',
                fillColor: 0xFFFF9800,
                textColor: 0xFFFFFFFF,
                callback: btnOnClick,
              ),
            ],
          ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  text: '7',
                  fillColor: 0xFF009688,
                  textColor: 0xFFFFFFFF,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  text: '8',
                  fillColor: 0xFF009688,
                  textColor: 0xFFFFFFFF,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  text: '9',
                  fillColor: 0xFF009688,
                  textColor: 0xFFFFFFFF,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  text: '×',
                  fillColor: 0xFFFF9800,
                  textColor: 0xFFFFFFFF,
                  callback: btnOnClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  text: '4',
                  fillColor: 0xFF009688,
                  textColor: 0xFFFFFFFF,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  text: '5',
                  fillColor: 0xFF009688,
                  textColor: 0xFFFFFFFF,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  text: '6',
                  fillColor: 0xFF009688,
                  textColor: 0xFFFFFFFF,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  text: '-',
                  fillColor: 0xFFFF9800,
                  textColor: 0xFFFFFFFF,
                  callback: btnOnClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  text: '1',
                  fillColor: 0xFF009688,
                  textColor: 0xFFFFFFFF,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  text: '2',
                  fillColor: 0xFF009688,
                  textColor: 0xFFFFFFFF,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  text: '3',
                  fillColor: 0xFF009688,
                  textColor: 0xFFFFFFFF,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  text: '+',
                  fillColor: 0xFFFF9800,
                  textColor: 0xFFFFFFFF,
                  callback: btnOnClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  text: '.',
                  fillColor: 0xFF009688,
                  textColor: 0xFFFFFFFF,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  text: '0',
                  fillColor: 0xFF009688,
                  textColor: 0xFFFFFFFF,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  text: '00',
                  fillColor: 0xFF009688,
                  textColor: 0xFFFFFFFF,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  text: '=',
                  fillColor: 0xFFF44336,
                  textColor: 0xFFFFFFFF,
                  callback: btnOnClick,
                ),
              ],
            ),
          ],
         ),
      ),
    );
  }
}
