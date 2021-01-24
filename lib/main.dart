import 'package:flutter/material.dart';
import 'package:lekha_jokha/providers/data_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var name;

  var age;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context)=>DataProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Check'),
          ),
          body: Column(
            children: [
          TextField(
            onChanged: (text) {
              name = text;
            },
          decoration: InputDecoration(
          border: InputBorder.none,
              hintText: 'Name',
          ),
            ),
          TextField(
            onChanged: (text) {
              age = text;
            },
          decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'age',
           ),
          ),
              FlatButton(onPressed: () {
                Provider.of<DataProvider>(context, listen: false).uploadData(name, age);
              },
                  child: Text('Submit')),
            ],
          ),
        ),
      ),
    );
  }
}
