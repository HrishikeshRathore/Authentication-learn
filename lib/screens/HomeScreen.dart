import 'package:flutter/material.dart';
import 'package:lekha_jokha/models/person.dart';
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

  final nameController = TextEditingController();
  final ageController = TextEditingController();
  var selectedId;

  bool isEditing = false;

  Future<void> getData() async{
    await Provider.of<DataProvider>(context, listen: false).getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check'),
      ),
      body: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Name',
            ),

          ),
          TextField(
            controller: ageController,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'age',
            ),
          ),
          FlatButton(onPressed: () async{
            if(isEditing)
              await Provider.of<DataProvider>(context, listen: false).updateData(Person(name: nameController.text, age: ageController.text, id: selectedId));
            else
              await Provider.of<DataProvider>(context, listen: false).uploadData(Person(name: nameController.text, age: ageController.text));
            nameController.text = '';
            ageController.text = '';
            isEditing = false;
            await getData();
          },
              child: Text(isEditing ? 'update' : 'add')),

          FlatButton(onPressed: () async{
            await Provider.of<DataProvider>(context, listen: false).getData();
          }, child: Text('get data')),

          Expanded(
            child: Consumer<DataProvider>(
              builder: (BuildContext context, data, Widget child) {
                return data.listPersons.length == 0 ? Text('No Data') : Container(
                  child: Padding(padding: EdgeInsets.all(8),
                    child: ListView.builder(
                      itemBuilder: (ctx, i) => ListTile(
                        title: Text(data.listPersons[i].name),
                        subtitle: Text(data.listPersons[i].age),
                        trailing: IconButton(icon: Icon(Icons.delete), onPressed: () async{
                          selectedId = data.listPersons[i].id;
                          await Provider.of<DataProvider>(context, listen: false).deleteData(selectedId);
                          await getData();
                        },),
                        leading: IconButton(icon: Icon(Icons.edit), onPressed: () {
                      setState(() {
                        selectedId = data.listPersons[i].id;
                        nameController.text = data.listPersons[i].name;
                        ageController.text = data.listPersons[i].age;
                        isEditing = true;
                      });
                    },),
                      ),
                      itemCount: data.listPersons.length,
                    ),
                  ),
                );
              },

            ),
          ),

        ],
      ),
    );
  }
}
