import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  String result;
  var regno;
  Result(this.result, this.regno);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _MoveToLastScreen(context);
      },
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                _MoveToLastScreen(context);
              },
            ),
            title: Text("SONA KNOW YOUR HALL"),
          ),
          body: ListView(
            children: <Widget>[
              getImage(),
              Padding(
                padding: const EdgeInsets.only(
                    top: 150.0, right: 10.0, left: 10.0, bottom: 150.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    result == null
                        ? Center(
                            child: Text(
                              "Data Not Found",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Gsans',
                                  fontSize: 40.0,
                                  color: Colors.blue),
                            ),
                          )
                        : Center(
                            child: Text(
                              "    $regno\n$result",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Gsans',
                                  fontSize: 40.0,
                                  color: Colors.blue),
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _MoveToLastScreen(BuildContext context) {
    Navigator.pop(context);
  }

  Widget getImage() {
    AssetImage assetImage = AssetImage('images/logo.png');
    Image imageAsset = Image(image: assetImage);
    return Center(child: imageAsset);
  }
}
