import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:sona_know_your_hall/screens/Result.dart';

class HallAllotment extends StatefulWidget {
  @override
  _HallAllotmentState createState() => _HallAllotmentState();
}

class _HallAllotmentState extends State<HallAllotment> {
  final TIMEOUT = const Duration(seconds: 5);
  var result;
  int regno;
  String url;
  bool I = false;
  bool II = false;
  bool III = false;
  bool IV = false;
  bool ARREAR = false;

  TextEditingController textfield = TextEditingController();
  var _formkey = GlobalKey<FormState>();

  Map finalMap;

  ProgressDialog progressDialog;

  Future<void> loadurl() async {
    final response =
        await http.get(url, headers: {"Accept": "aplication/json"});
    if (response.statusCode == 200) {
      Map map = json.decode(response.body) as Map;
      setState(() {
        finalMap = map;
      });
//      print(finalMap);
    } else {
      throw Exception('Burpppp...');
    }

    for (var val in finalMap.values) {
      for (var vars in val) {
        if (vars['RegisterNumber'] == regno) {
          setState(() {
            result = vars['HallLocation'];
          });
          break;
        } else {
          setState(() {
            result = "Data not found";
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    progressDialog = ProgressDialog(context);

    progressDialog.style(
      message: 'Hey Please Wait...\ni am checking your hall',
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
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Please Enter Register Number";
                    }
                  },
                  onChanged: (value) {
                    setState(() {
                      regno = int.parse(value);
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
                  checkBox(I, "I"),
                  checkBox(II, "II"),
                  checkBox(III, "III"),
                  checkBox(IV, "IV"),
                  checkBox(ARREAR, "ARREAR"),
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
                        style: TextStyle(color: Colors.blue),
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
                            loadurl();
                            progressDialog.show();
                            Future.delayed(Duration(seconds: 4)).then(
                              (value) => progressDialog.hide().whenComplete(
                                    () => Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) {
                                        return Result(result, regno);
                                      }),
                                    ),
                                  ),
                            );
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
                  if (I == false) {
                    I = value;
                    url =
                        'https://script.google.com/macros/s/AKfycbxOLElujQcy1-ZUer1KgEvK16gkTLUqYftApjNCM_IRTL3HSuDk/exec?id=1x7_PkjeLxB3ZFUDw7naQ3tTx3gx6aYpNpOQAWH7zn74&sheet=Sheet1';
                    II = false;
                    III = false;
                    IV = false;
                    ARREAR = false;
                  }
                  break;
                case 'II':
                  if (II == false) {
                    II = value;
                    url =
                        'https://script.google.com/macros/s/AKfycbxOLElujQcy1-ZUer1KgEvK16gkTLUqYftApjNCM_IRTL3HSuDk/exec?id=18S6qFb19RUaze6k018Bsh2_qI9I5YSv_Rf4g2uoxRn4&sheet=Sheet1';
                    I = false;
                    III = false;
                    IV = false;
                    ARREAR = false;
                  }
                  break;
                case 'III':
                  if (III == false) {
                    III = value;
                    url =
                        'https://script.google.com/macros/s/AKfycbxOLElujQcy1-ZUer1KgEvK16gkTLUqYftApjNCM_IRTL3HSuDk/exec?id=1Pz00F6sBUzIvxIKNClFcjNxz4JN2lE8Fg0ooL7y_Idc&sheet=Sheet1';
                    I = false;
                    II = false;
                    IV = false;
                    ARREAR = false;
                  }
                  break;
                case 'IV':
                  if (IV == false) {
                    IV = value;
                    url =
                        'https://raw.githubusercontent.com/gokul1630/ExamHallFinder_flutter/master/data.json';
                    I = false;
                    II = false;
                    III = false;
                    ARREAR = false;
                  }
                  break;
                case 'ARREAR':
                  if (ARREAR == false) {
                    ARREAR = value;
                    url =
                        'https://raw.githubusercontent.com/gokul1630/ExamHallFinder_flutter/master/data.json';
                    I = false;
                    II = false;
                    III = false;
                    IV = false;
                  }
                  break;
              }
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
}
