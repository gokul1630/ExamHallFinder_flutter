import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './screens/WelcomePage.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flutter App",
        home: Scaffold(
          backgroundColor: Colors.lightBlueAccent,
          appBar: AppBar(
            title: Text("SONA KNOW YOUR HALL"),
          ),
          body: MainPage(),
        ),
      ),
    );
