import 'package:flutter/material.dart';

import './About.dart';
import './HallNumber_series.dart';
import './hall_allotment.dart';

class MainPage extends StatelessWidget {
  Widget getImage() {
    AssetImage assetImage = AssetImage('images/logo.png');
    Image imageAsset = Image(image: assetImage);
    return Center(child: imageAsset);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        getImage(),
        SizedBox(
          height: 50.0,
        ),
        Center(
          child: RaisedButton(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, bottom: 10.0, right: 14.0, left: 14.0),
              child: Text(
                """HALL\nALLOTMENT""",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.blue,
                    fontFamily: 'Gsans',
                    fontWeight: FontWeight.bold),
              ),
            ),
            color: Colors.white,
            highlightColor: Colors.blueAccent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(color: Colors.blue)),
            elevation: 10.0,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return HallAllotment();
              }));
            },
          ),
        ),
        SizedBox(height: 20.0),
        Center(
          child: RaisedButton(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, bottom: 10.0, left: 5.0, right: 5.0),
              child: Text(
                """HALL NUMBER\nSERIES""",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.blue,
                    fontFamily: 'Gsans',
                    fontWeight: FontWeight.bold),
              ),
            ),
            color: Colors.white,
            highlightColor: Colors.blueAccent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(color: Colors.blue)),
            elevation: 10.0,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return HallNumSeries();
              }));
            },
          ),
        ),
        SizedBox(height: 20.0),
        Center(
          child: RaisedButton(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                bottom: 20.0,
                left: 40.0,
                right: 36.0,
              ),
              child: Text(
                "ABOUT",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.blue,
                    fontFamily: 'Gsans',
                    fontWeight: FontWeight.bold),
              ),
            ),
            color: Colors.white,
            highlightColor: Colors.blueAccent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(color: Colors.blue)),
            elevation: 10.0,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return About();
              }));
            },
          ),
        ),
        SizedBox(height: 20.0),
      ],
    );
  }
}
