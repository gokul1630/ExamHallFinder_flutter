import 'dart:convert';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:sona_know_your_hall/screens/Result.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class HallAllotment extends StatefulWidget {
  @override
  _HallAllotmentState createState() => _HallAllotmentState();
}

class _HallAllotmentState extends State<HallAllotment> {
  var hallLocation;

  int registerNumber;

  String url;

  bool year_1 = false;
  bool year_2 = false;
  bool year_3 = false;
  bool year_4 = false;
  bool arrears = false;

  TextEditingController textfield = TextEditingController();
  var _formkey = GlobalKey<FormState>();

  Map finalMap;

  ProgressDialog progressDialog;

  Future<void> loadurl() async {
    final response =
        await http.get(url, headers: {"Accept": "aplication/json"});

    Map map = json.decode(response.body) as Map;

    if (response.statusCode == 200) {
      setState(() {
        finalMap = map;
      });
    } else {
      print(response.statusCode);
    }

    for (var val in finalMap.values) {
      for (var vars in val) {
        if (year_4 == false) {
          if (vars['RegisterNumber'] == registerNumber) {
            setState(() {
              hallLocation = vars['HallLocation'];
            });
            break;
          } else {
            setState(() {
              hallLocation = "Data not found";
            });
          }
        } else {
          if (vars['id'] == registerNumber) {
            setState(() {
              hallLocation = vars['name'];
            });
            break;
          } else {
            setState(() {
              hallLocation = "Data not found";
            });
          }
        }
      }
    }
  }

  Column checkBox(bool year, String title) {
    return Column(
      children: <Widget>[
        Text(title),
        Checkbox(
          value: year,
          onChanged: (bool value) {
            setState(() {
              switch (title) {
                case 'I':
                  if (year_1 == false) {
                    year_1 = value;
                    url =
                        'https://script.google.com/macros/s/AKfycbxOLElujQcy1-ZUer1KgEvK16gkTLUqYftApjNCM_IRTL3HSuDk/exec?id=1x7_PkjeLxB3ZFUDw7naQ3tTx3gx6aYpNpOQAWH7zn74&sheet=Sheet1';
                    year_2 = false;
                    year_3 = false;
                    year_4 = false;
                    arrears = false;
                  }
                  break;
                case 'II':
                  if (year_2 == false) {
                    year_2 = value;
                    url =
                        'https://script.google.com/macros/s/AKfycbxOLElujQcy1-ZUer1KgEvK16gkTLUqYftApjNCM_IRTL3HSuDk/exec?id=18S6qFb19RUaze6k018Bsh2_qI9I5YSv_Rf4g2uoxRn4&sheet=Sheet1';
                    year_1 = false;
                    year_3 = false;
                    year_4 = false;
                    arrears = false;
                  }
                  break;
                case 'III':
                  if (year_3 == false) {
                    year_3 = value;
                    url =
                        'https://script.google.com/macros/s/AKfycbxOLElujQcy1-ZUer1KgEvK16gkTLUqYftApjNCM_IRTL3HSuDk/exec?id=1Pz00F6sBUzIvxIKNClFcjNxz4JN2lE8Fg0ooL7y_Idc&sheet=Sheet1';
                    year_1 = false;
                    year_2 = false;
                    year_4 = false;
                    arrears = false;
                  }
                  break;
                case 'IV':
                  if (year_4 == false) {
                    year_4 = value;
                    url =
                        'https://script.google.com/macros/s/AKfycbxOLElujQcy1-ZUer1KgEvK16gkTLUqYftApjNCM_IRTL3HSuDk/exec?id=1FJlLcWbrN1smoW4uS-u9GfOEqpuwCDFatKBbif5UPlc&sheet=Sheet1';
                    year_1 = false;
                    year_2 = false;
                    year_3 = false;
                    arrears = false;
                  }
                  break;
                case 'ARREAR':
                  if (arrears == false) {
                    arrears = value;
                    url =
                        'https://script.google.com/macros/s/AKfycbxOLElujQcy1-ZUer1KgEvK16gkTLUqYftApjNCM_IRTL3HSuDk/exec?id=10LDWcToxMercPRC6vQ1QXD3ocBUZjDeFfYwJlfNtlbg&sheet=Sheet1';
                    year_1 = false;
                    year_2 = false;
                    year_3 = false;
                    year_4 = false;
                  }
                  break;
              }
              print(url);
            });
          },
        ),
      ],
    );
  }

  Widget getImage() {
    AssetImage assetImage = AssetImage('images/logo.png');
    Image imageAsset = Image(image: assetImage);
    return Center(child: imageAsset);
  }

  void resetString() {
    hallLocation = null;
  }

  void _snackBar(BuildContext context) {
    Flushbar(
            margin: EdgeInsets.all(10.0),
            message: 'Please Select Year',
            duration: Duration(seconds: 3),
            icon: Icon(Icons.info_outline, color: Colors.white),
            backgroundColor: Colors.black,
            maxWidth: 200,
            borderRadius: 10.0)
        .show(context);
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveWidgets.init(
      context,
      height: 1920, // Optional
      width: 1080, // Optional
      allowFontScaling: true, // Optional
    );
    progressDialog = ProgressDialog(context);
    progressDialog.style(
      message: 'Hey Please Wait...\ni am checking your hall',
      textAlign: TextAlign.center,
      borderRadius: 20.0,
      padding: EdgeInsets.all(10.0),
    );
    return Form(
      key: _formkey,
      child: Scaffold(
        appBar: AppBar(
          title: Text("SONA KNOW YOUR EXAM HALL"),
        ),
        body: Center(
          child: ListView(
            children: <Widget>[
              getImage(),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 60.0, left: 60.0),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  controller: textfield,
                  // ignore: missing_return
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Please Enter Register Number";
                    }
                  },
                  onChanged: (value) {
                    setState(() {
                      registerNumber = int.parse(value);
                    });
                  },
                  decoration: InputDecoration(
                      labelText: 'Enter Register Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      )),
                  keyboardType: TextInputType.numberWithOptions(signed: false),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  checkBox(year_1, "I"),
                  checkBox(year_2, "II"),
                  checkBox(year_3, "III"),
                  checkBox(year_4, "IV"),
                  checkBox(arrears, "ARREAR"),
                ],
              ),
              SizedBox(height: 20.0),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      child: Text(
                        "CHECK",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.blue, fontSize: 20.0),
                      ),
                      color: Colors.white,
                      highlightColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Colors.blue),
                      ),
                      elevation: 10.0,
                      onPressed: () {
                        setState(() {
                          if (_formkey.currentState.validate()) {
                            resetString();
                            loadurl();
                            if (url == null) {
                              _snackBar(context);
                            } else {
                              progressDialog.show();
                              Future.delayed(Duration(seconds: 4)).then(
                                (value) => progressDialog.hide().whenComplete(
                                      () => Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) {
                                          return Result(
                                              hallLocation, registerNumber);
                                        }),
                                      ),
                                    ),
                              );
                            }
                          }
                        });
                      },
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
}
