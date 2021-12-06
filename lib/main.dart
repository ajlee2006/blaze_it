// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  var now = DateTime.now();
  var _time = "Initialising...";
  var _sign = "";
  var _num = 0;
  var _extra = "";

  @override
  void initState(){
    Timer.periodic(Duration(milliseconds:500), (Timer t) => setState((){
      now = DateTime.now();
      _time = now.hour.toString() + ":" + now.minute.toString().padLeft(2, '0');
      var num = (now.hour*60 + now.minute) % 720 - 260;
      if ((num-720).abs() < num.abs()) {
        num -= 720;
      }
      _num = num.abs();
      if (num >= 0) {
        _sign = "+";
      } else {
        _sign = "-";
      }
      _extra = "";
    }));
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xFF000000),
          appBar: AppBar(
            backgroundColor: const Color(0xFFE25822),
            title: Text("Blaze it clock")
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("The time is " + _time + "\n", style: TextStyle(fontSize: 18.0, color: const Color(0xFFFFFFFF))),
                Text("blaze it " + _sign, style: TextStyle(fontSize: 70.0, color: const Color(0xFFFFFFFF))),
                Text(_num.toString(), style: TextStyle(fontSize: 120.0, fontWeight: FontWeight.bold, color: const Color(0xFFFFFFFF))),
                Text(_extra, style: TextStyle(fontSize: 18.0, color: const Color(0xFFFFFFFF))),
              ],
            ),
          ),
          drawer: Drawer(
            child: ListTile(
              title: Text('''\nThis app counts the number of minutes to 4:20 (am/pm).

Nice timings: (works for both am and pm)
1:29 - blaze it + 123456789
1:38 - blaze it + 12345678
2:17 - blaze it - 123
2:35 - blaze it - 12345
3:11 - blaze it - 69
3:38 - blaze it - 42
4:11 - blaze it - 696969
4:29 - blaze it + 696969
5:02 - blaze it + 42
5:29 - blaze it + 69
6:05 - blaze it + 12345
6:23 - blaze it + 123
7:02 - blaze it - 12345678
7:11 - blaze it - 123456789
7:46 - blaze it - 1234
8:11 - blaze it - 6969
8:13 - blaze it - 1234567
8:29 - blaze it + 420696969
8:50 - blaze it - 1234567890
9:20 - blaze it - 420
9:29 - blaze it + 42069
9:56 - blaze it + 123456
10:44 - blaze it - 123456
11:11 - blaze it - 42069
11:20 - blaze it + 420
11:50 - blaze it + 1234567890
12:11 - blaze it - 420696969
12:27 - blaze it + 1234567
12:29 -  blaze it + 6969
12:54 - blaze it + 1234'''),
            ),
          ),
        ),
      ),
    );
  }
}
