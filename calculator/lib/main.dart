import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

import 'package:calculator/widgets/calcButton.dart';

void main() {
  runApp(CalcApp());
}

class CalcApp extends StatefulWidget {
  final Function equals;
  CalcApp({Key key, this.equals}) : super(key: key);

  @override
  _CalcAppState createState() => _CalcAppState();
}

class _CalcAppState extends State<CalcApp> {
  // String _histHistory = "";
  String _history = "";
  String _expression = "";

  void numClick(String text) {
    setState(() {
      // _expression = "";
      // for (int count = 15; _expression.length < count; count-1) {
      _expression += text;
      // }
    });
  }

  void percentageClick(String text) {
    Parser pi = Parser();
    double percent = double.parse(_expression) / 100;
    setState(() {
      _expression = percent.toString();
    });
  }

  void deleteClick(String text) {
    setState(() {
      if (_expression != null && _expression.length > 0) {
        _expression = _expression.substring(0, _expression.length - 1);
      }
      // _expression -= text;
    });
  }

  void subtractClick(String text) {
    setState(() {
      _expression += "-";
    });
  }

  void multiplyClick(String text) {
    setState(() {
      _expression += "*";
    });
  }

  void divideClick(String text) {
    setState(() {
      _expression += "/";
    });
  }

  void allClear(String text) {
    setState(() {
      // _histHistory = "";
      _history = "";
      _expression = "";
    });
  }

  void clear(String text) {
    setState(() {
      _expression = "";
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      // _histHistory = _history;
      _history = _expression + " =";
      _expression = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator_',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Color(0XFFFEFEFE),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        backgroundColor: Color(0XFF2A2A2A),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 38, left: 38),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Container(
                  //   margin: EdgeInsets.all(10),
                  //   child: Text(
                  //     _histHistory,
                  //     style: GoogleFonts.orbitron(
                  //       textStyle: TextStyle(
                  //         fontSize: 14,
                  //         color: Colors.white12,
                  //         fontWeight: FontWeight.w400,
                  //         letterSpacing: 1.5,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      _history,
                      style: GoogleFonts.orbitron(
                        textStyle: TextStyle(
                          fontSize: 22,
                          color: Colors.white24,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Text(
                      _expression,
                      style: GoogleFonts.orbitron(
                        textStyle: TextStyle(
                          fontSize: 46,
                          color: Color(0XFF66BE53),
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          width: 200,
                          height: .3,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 20, left: 20, bottom: 30, top: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalcButton(
                        text: "AC",
                        fillColor: 0XFF414141,
                        textColor: 0XFFFFFFFF,
                        textSize: 16,
                        callback: allClear,
                      ),
                      CalcButton(
                        text: "⌫",
                        fillColor: 0XFF414141,
                        textColor: 0XFF696969,
                        fontWeight: FontWeight.w100,
                        textSize: 20,
                        callback: deleteClick,
                      ),
                      CalcButton(
                        text: "%",
                        fillColor: 0XFF414141,
                        textColor: 0XFFFFFFFF,
                        callback: percentageClick,
                        fontWeight: FontWeight.w400,
                      ),
                      // CalcButton(
                      //   text: "^",
                      //   fillColor: 0XFF414141,
                      //   textColor: 0XFF757575,
                      //   fontWeight: FontWeight.w500,
                      //   textSize: 22,
                      //   callback: numClick,
                      // ),
                      CalcButton(
                        fillColor: 0XFF414141,
                        textColor: 0XFFFFFFFF,
                        callback: multiplyClick,
                        text: "⨉",
                        textSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalcButton(
                        text: "7",
                        textColor: 0XFFFFFFFF,
                        callback: numClick,
                      ),
                      CalcButton(
                        text: "8",
                        textColor: 0XFFFFFFFF,
                        callback: numClick,
                      ),
                      CalcButton(
                        text: "9",
                        textColor: 0XFFFFFFFF,
                        callback: numClick,
                      ),
                      CalcButton(
                        fillColor: 0XFF414141,
                        textColor: 0XFFFFFFFF,
                        callback: divideClick,
                        text: "/",
                        textSize: 20,
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalcButton(
                        text: "4",
                        textColor: 0XFFFFFFFF,
                        callback: numClick,
                      ),
                      CalcButton(
                        text: "5",
                        textColor: 0XFFFFFFFF,
                        callback: numClick,
                      ),
                      CalcButton(
                        text: "6",
                        textColor: 0XFFFFFFFF,
                        callback: numClick,
                      ),
                      CalcButton(
                        fillColor: 0XFF414141,
                        textColor: 0XFFFFFFFF,
                        callback: subtractClick,
                        text: "-",
                        textSize: 24,
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalcButton(
                        text: "1",
                        textColor: 0XFFFFFFFF,
                        callback: numClick,
                      ),
                      CalcButton(
                        text: "2",
                        textColor: 0XFFFFFFFF,
                        callback: numClick,
                      ),
                      CalcButton(
                        text: "3",
                        textColor: 0XFFFFFFFF,
                        callback: numClick,
                      ),
                      CalcButton(
                        text: "+",
                        fillColor: 0XFF414141,
                        textColor: 0XFFFFFFFF,
                        callback: numClick,
                        textSize: 35,
                        fontWeight: FontWeight.w100,
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              CalcButton(
                                text: "0",
                                textColor: 0XFFFFFFFF,
                                callback: numClick,
                              ),
                              SizedBox(width: 18),
                              CalcButton(
                                text: ".",
                                textColor: 0XFFFFFFFF,
                                callback: numClick,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 45,
                        width: 130,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "=",
                            style: GoogleFonts.orbitron(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  color: Color(0XFFFFFFFF)),
                            ),
                          ),
                          onPressed: () {
                            evaluate(_expression);
                          },
                          color: Color(0XFF171717),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
