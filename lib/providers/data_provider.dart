import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:lekha_jokha/models/person.dart';
import 'api_data.dart';

class DataProvider with ChangeNotifier{
  
  List<Person> listPersons = [];
  
  void uploadData(Person person) {
    API.uploadToFirebase('persons', {'name': person.name, 'age': person.age});
  }

  Future<void> getData() async{
    var personsData = await API.getFromFirebase();
    print(jsonDecode(personsData));
    var data = jsonDecode(personsData) as Map;
    List<Person> tempList =[];
    data.forEach((key, value) {
      tempList.add(
        Person(name: value['name'], age: value['age'],id: key)
      );
    });
    listPersons = tempList;
    notifyListeners();
  }

}