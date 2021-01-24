import 'dart:convert';

import 'package:http/http.dart' as http;

class API {
  static Future<void> uploadToFirebase(String database, Map<String, dynamic> data) async{
    await http.post('https://learning-project-a9400-default-rtdb.firebaseio.com/$database.json', body: jsonEncode(data));
  }

  static Future<String> getFromFirebase() async{
    http.Response response = await http.get('https://learning-project-a9400-default-rtdb.firebaseio.com/persons.json');
    return response.body;
  }

  static Future<void> updateOnFirebase(String id, Map<String, dynamic> updatedData) async{
    await http.put('https://learning-project-a9400-default-rtdb.firebaseio.com/persons/$id.json', body: jsonEncode(updatedData));
  }

}