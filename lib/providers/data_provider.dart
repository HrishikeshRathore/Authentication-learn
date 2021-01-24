import 'package:flutter/cupertino.dart';
import 'api_data.dart';

class DataProvider with ChangeNotifier{
  void uploadData(String name, String age) {
    API.uploadToFirebase({'name': name, 'age': age});
  }
}