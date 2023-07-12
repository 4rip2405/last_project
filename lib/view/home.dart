import 'package:last_project/view/penyakit1.dart';
import 'package:flutter/material.dart';

class homee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white10,
        title: Text('wabah penyakit yang berbahaya didunia'),
        actions: <Widget>[
          IconButton(
            icon: new Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: new Icon(Icons.menu, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("covid 19"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => penyakit1()));
            },
          ),
          ListTile(
            title: Text("penyakit obstruktif kronis(pok)"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => penyakit1()));
            },
          ),
        ],
      ),
    );
  }
}