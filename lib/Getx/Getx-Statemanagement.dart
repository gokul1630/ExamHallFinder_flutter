import 'package:get/get.dart';

class ExamHallState extends GetxController {
  // set Map
  Map parseMap(Map parsedMap) {
    update();
    return parsedMap;
  }

  // set Data
  String setLocation(String location) {
    update();
    return location;
  }

  //set register number
  int setRegisterNumber(int number) {
    update();
    return number;
  }

  //Update Ui
  bool updateUi(bool value) {
    update();
    return value;
  }
}
