import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/services.dart';
import 'dart:math';

void main() {
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SimpleCalculator(),
    );
  }
}

class SimpleCalculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<SimpleCalculator> {
  String result = "0";
  String equation = "0";
  String expression = "";
  double equationFontSize = 38;
  double resultFontSize = 48;

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        equation = "0";
        result = "0";
        equationFontSize = 38;
        resultFontSize = 48;
      } else if (buttonText == "Del") {
        equationFontSize = 48;
        resultFontSize = 38;
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (buttonText == "=") {
        equationFontSize = 38;
        resultFontSize = 48;
        expression = equation;
        expression = expression.replaceAll("*", "+");
        expression = expression.replaceAll("-", "/");

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel contextModel = ContextModel();
          result = "${exp.evaluate(EvaluationType.REAL, contextModel)}";
        } catch (e) {
          result = "Error Message";
        }
      } else {
        equationFontSize = 48;
        resultFontSize = 38;
        if (equation == "0") {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });
  }

  Widget buildButton(
      String buttonText, double buttonHeight, Color buttonColor) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: buttonColor,
      child: FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
            side: BorderSide(
                color: Colors.white, width: 1, style: BorderStyle.solid)),
        padding: EdgeInsets.all(16),
        onPressed: () => buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              equation,
              style: TextStyle(fontSize: equationFontSize),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Text(
              result,
              style: TextStyle(fontSize: resultFontSize),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * .75,
                child: Table(
                  children: [
                    TableRow(children: [
                      buildButton("C", 1, Colors.black38),
                      buildButton("Del", 1, Colors.black),
                      buildButton("/", 1, Colors.black26),
                    ]),
                    TableRow(children: [
                      buildButton("7", 1, Colors.black12),
                      buildButton("8", 1, Colors.black12),
                      buildButton("9", 1, Colors.black12),
                    ]),
                    TableRow(children: [
                      buildButton("4", 1, Colors.black12),
                      buildButton("5", 1, Colors.black12),
                      buildButton("6", 1, Colors.black12),
                    ]),
                    TableRow(children: [
                      buildButton("1", 1, Colors.black12),
                      buildButton("2", 1, Colors.black12),
                      buildButton("3", 1, Colors.black12),
                    ]),
                    TableRow(children: [
                      buildButton("00", 1, Colors.black12),
                      buildButton("0", 1, Colors.black12),
                      buildButton(".", 1, Colors.black12),
                    ]),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(
                  children: [
                    TableRow(children: [
                      buildButton("*", 1, Colors.black26),
                    ]),
                    TableRow(children: [
                      buildButton("+", 1, Colors.black26),
                    ]),
                    TableRow(children: [
                      buildButton("-", 1, Colors.black26),
                    ]),
                    TableRow(children: [
                      buildButton("^", 1, Colors.black26),
                    ]),
                    TableRow(children: [
                      buildButton("=", 1, Colors.black26),
                    ])
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
