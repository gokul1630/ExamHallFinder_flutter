import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class HallNumSeries extends StatelessWidget {
  Widget getImage() {
    AssetImage assetImage = AssetImage('images/logo.png');
    Image imageAsset = Image(image: assetImage);
    return Center(child: imageAsset);
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveWidgets.init(
      context,
      height: 1920, // Optional
      width: 1080, // Optional
      allowFontScaling: true, // Optional
    );

    return ResponsiveWidgets.builder(
      height: 1920, // Optional
      width: 1080, // Optional
      allowFontScaling: true, // Optional
      child: Scaffold(
        appBar: AppBar(
          title: Text("HALL NUMBER SERIES"),
        ),
        body: ListView(
          children: <Widget>[
            getImage(),
            SizedBox(height: 20.0),
            TextResponsive(
              """
            MECH/EEE BLOCK
                   Ground floor-102-106
                   First Floor-111-119
                   Second Floor-121-128
                   
            MBA BLOCK
                   Ground floor-201-202
                   First Floor-211-214
                   Second Floor-221-224

            CSE BLOCK
                   Ground floor-302-303
                   First Floor-311-314
                   Second Floor-321-324

            FT BLOCK
                   First Floor-421-426
                   Third Floor-431-435

            IT BLOCK
                   Ground floor-502-504
                   Second Floor-521-524
                   Third Floor-532-535
 
            CIVIL BLOCK
                   Ground floor-601-603
                   First Floor-614
                   Second Floor-621-624
                   Third Floor-631-634
   
            ECE BLOCK
                   First Floor-911-914
                   Second Floor-921-924
                   Third Floor-932-936

            MCA BLOCK
                   Ground floor-1001-1005
                   First Floor-1013-1014
                   Second Floor-1023-1025
                   """,
              style: TextStyle(fontSize: 50.0, fontFamily: 'Gsans'),
            ),
          ],
        ),
      ),
    );
  }
}
