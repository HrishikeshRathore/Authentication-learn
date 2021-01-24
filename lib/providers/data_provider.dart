import 'package:flutter/cupertino.dart';
import 'api_data.dart';

class DataProvider with ChangeNotifier{
  void uploadData(String name, String age) {
    API.uploadToFirebase('persons', {'name': name, 'age': age});
  }

  void uploadData2(String vehicle) {
    API.uploadToFirebase('vehicles', {'vehicle': vehicle});
  }

}