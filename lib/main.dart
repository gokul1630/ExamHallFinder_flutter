import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './screens/About.dart';
import './screens/HallNumber_series.dart';
import './screens/hall_allotment.dart';

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
        Center(
          child: RaisedButton(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                bottom: 20.0,
                left: 50.0,
                right: 50.0,
              ),
              child: Text(
                "EXIT",
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
              SystemNavigator.pop();
            },
          ),
        ),
        SizedBox(height: 20.0),
      ],
    );
  }
}
