import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalcButton extends StatelessWidget {
  final String text;
  final int textColor;
  final int fillColor;
  final double textSize;
  final Function callback;
  final FontWeight fontWeight;
  const CalcButton({
    Key key,
    this.text,
    this.textColor,
    this.fillColor,
    this.textSize = 18,
    this.callback,
    this.fontWeight = FontWeight.w400,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 45,
          width: 60,
          child: FlatButton(
            splashColor: Colors.white10.withOpacity(0.0),
            hoverColor: Colors.white.withOpacity(0.5),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
            child: Center(
              child: Text(
                text,
                style: GoogleFonts.orbitron(
                  textStyle: TextStyle(
                    fontWeight: fontWeight,
                    fontSize: textSize,
                  ),
                ),
              ),
            ),
            onPressed: () {
              callback(text);
            },
            color: fillColor != null ? Color(fillColor) : null,
            textColor: Color(textColor),
            
          ),
        ),
      ],
    );
  }
}
