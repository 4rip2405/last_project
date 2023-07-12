import 'package:last_project/view/penyakit1.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wabah penyakit yang ada didunia',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: home(),
    );
  }
}

class home extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<home> {
  List<String> items = [];

  TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void addItem(String item) {
    setState(() {
      items.add(item);
    });
  }

  void updateItem(int index, String item) {
    setState(() {
      items[index] = item;
    });
  }

  void deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  void showEditDialog(int index) {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController editController =
            TextEditingController(text: items[index]);

        return AlertDialog(
          title: Text('Edit Berita'),
          content: TextField(controller: editController),
          actions: <Widget>[
            TextButton(
              child: Text('Simpan'),
              onPressed: () {
                updateItem(index, editController.text);
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wabah penyakit yang ada didunia'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    showEditDialog(index);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    deleteItem(index);
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Add Item'),
                content: TextField(
                  controller: _textEditingController,
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text('Save'),
                    onPressed: () {
                      addItem(_textEditingController.text);
                      _textEditingController.clear();
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text('Batal'),
                    onPressed: () {
                      _textEditingController.clear();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },

        