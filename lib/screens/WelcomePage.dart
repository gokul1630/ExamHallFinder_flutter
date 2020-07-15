import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sona_know_your_hall/screens/About.dart';
import 'package:sona_know_your_hall/screens/HallNumber_series.dart';

import './hall_allotment.dart';

class MainPage extends StatelessWidget {
  Widget getImage() {
    AssetImage assetImage = AssetImage('images/logo.png');
    Image imageAsset = Image(image: assetImage);
    return Center(child: imageAsset);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [blue, white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: ListView(
        children: <Widget>[
          getImage(),
          SizedBox(
            height: 50.0,
          ),
          Center(
            child: NavigationButton(
              """HALL\nALLOTMENT""",
              HallAllotment(),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Center(
            child: NavigationButton("""HALL NUMBER\nSERIES""", HallNumSeries()),
          ),
          SizedBox(
            height: 20.0,
          ),
          Center(
            child: NavigationButton(
              'ABOUT',
              About(),
            ),
          ),
          SizedBox(height: 20.0),
          Center(
            child: NavigationButton('EXIT'),
          ),
        ],
      ),
    );
  }
}

class NavigationButton extends StatelessWidget {
  final navigator;
  final text;
  NavigationButton(this.text, [this.navigator]);
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 0.2;
    var width = MediaQuery.of(context).size.width;
    var queryData = MediaQuery.of(context);
    print(height);
    return ButtonTheme(
      minWidth: width * 0.45,
      height: width * 0.20,
      child: RaisedButton(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: width * 0.05, //20.0,
              color: blue,
              fontFamily: 'Gsans',
              fontWeight: FontWeight.bold),
        ),
        color: white,
        highlightColor: blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(
            color: white,
          ),
        ),
        elevation: 10.0,
        onPressed: () {
          text == 'EXIT'
              ? SystemNavigator.pop()
              : Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return navigator;
                    },
                  ),
                );
        },
      ),
    );
  }
}
