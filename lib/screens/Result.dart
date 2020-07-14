import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:sona_know_your_hall/screens/hall_allotment.dart';

// ignore: must_be_immutable
class Result extends StatelessWidget {
  var location;
  var registerNumber;

  Result(this.location, this.registerNumber);
  @override
  Widget build(BuildContext context) {
    ResponsiveWidgets.init(
      context,
      height: 1920, // Optional
      width: 1080, // Optional
      allowFontScaling: true, // Optional
    );
    return WillPopScope(
      // ignore: missing_return
      onWillPop: () {
        _moveToLastScreen(context);
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                _moveToLastScreen(context);
              },
            ),
            title: Text("SONA KNOW YOUR HALL"),
          ),
          body: ListView(
            children: <Widget>[
              getImage(),
              SizedBox(
                height: 150.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  location == null
                      ? Center(
                          child: Text(
                            "Data Not Found\nPlease Try Again",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Gsans',
                                fontSize: 30.0,
                                color: blue),
                          ),
                        )
                      : Text(
                          "$registerNumber\n$location",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Gsans',
                              fontSize: 40.0,
                              color: blue),
                        ),
                ],
              ),
              SizedBox(
                height: 100.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _moveToLastScreen(BuildContext context) {
    Navigator.pop(context);
  }

  Widget getImage() {
    AssetImage assetImage = AssetImage('images/logo.png');
    Image imageAsset = Image(image: assetImage);
    return Center(child: imageAsset);
  }
}
