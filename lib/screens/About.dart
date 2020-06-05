import 'package:flutter/material.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ResponsiveWidgets.init(
      context,
      height: 1920, // Optional
      width: 1080, // Optional
      allowFontScaling: true, // Optional
    );
    Widget getImage() {
      AssetImage assetImage = AssetImage('images/logo.png');
      Image imageAsset = Image(image: assetImage);
      return Center(child: imageAsset);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
      ),
      body: ListView(
        children: <Widget>[
          getImage(),
          SizedBox(
            height: 20.0,
          ),
          Container(
            child: TextResponsive(
              """
        About:
         Application helpful for the
         students to check their
         allotment of exam hall.
         Application developed by
         Information Technology

       - Dr.J.Akilandeswari,Prof &
         Head/IT
       - Dr.G.Jothi,SRF/IT
       - Mr.A.NaveenKumar,JRF/IT
       - Mr.S.Sashang,(2018-2022)/IT

        This Application is fully 
        rewritten in Flutter by
         
       - M.Gokulprasanth,
         (2018-2021)/EEE.  
                  """,
              style: TextStyle(fontSize: 50.0, fontFamily: 'Gsans'),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Center(
            child: Text(
              "Powered by Department of IT & EEE",
              style: TextStyle(fontSize: 15.0),
            ),
          ),
        ],
      ),
    );
  }
}
