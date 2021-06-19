import 'package:flutter/material.dart';

class CustomText extends Text {

  CustomText(
        String data,
        {
          color: Colors.white,
          textAlign: TextAlign.center,
          factor: 1.0,
          fontStyle: FontStyle.normal,
          fontSize: 20.0
        }
      ):
      super(
          data,
          textAlign: textAlign,
          textScaleFactor: factor,
          style: new TextStyle(
              color: color,
              fontStyle: fontStyle,
              fontSize: 20.0
          )
      );
}