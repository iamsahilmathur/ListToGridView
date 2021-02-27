
import 'package:flutter/material.dart';

class MyTheme{

  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.red,
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          textTheme: TextTheme(bodyText1: TextStyle(color: Colors.black),),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black)
        ),
  );
}