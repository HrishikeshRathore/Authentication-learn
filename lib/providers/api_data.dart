import 'dart:convert';

import 'package:http/http.dart' as http;

class API {
  static Future<void> uploadToFirebase(Map<String, dynamic> data) async{
    await http.post('https://learning-project-a9400-default-rtdb.firebaseio.com/persons.json', body: jsonEncode(data));
  }
}