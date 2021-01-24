import 'package:flutter/material.dart';
import 'package:lekha_jokha/providers/data_provider.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var name;
  var vehicle;
  var age;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

          TextField(
            onChanged: (text) {
              vehicle = text;
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Vehicles',
            ),
          ),
          FlatButton(onPressed: () {
            Provider.of<DataProvider>(context, listen: false).uploadData2(vehicle);
          },
              child: Text('Add')),


        ],
      ),
    );
  }
}
