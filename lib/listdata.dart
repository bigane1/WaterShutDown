import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mystore/Valve.dart';
import 'Detail.dart';
import 'adddata.dart';
import 'loginform.dart';
import 'homepage.dart';

class Home extends StatefulWidget {
  @override
  // final String text;
  // Home({Key key, @required this.text}) : super(key: key);
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController editingController = TextEditingController();
  Future<List<Valve>> getData(String query) async {
    final response = await http.get("http://localhost/WaterShutDown/restapi/getdata.php?query="+query);
    Iterable l = json.decode(utf8.decode(response.bodyBytes));
      List<Valve> valveList =
          List<Valve>.from(l.map((model) => Valve.fromJson(model)));
          setState(() => valveList = valveList);
    return valveList;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Valves List",
          style: TextStyle(fontFamily: "Netflix"),
        ),
        backgroundColor: Colors.pink,
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton.extended(
            heroTag: "logout",
            onPressed: () {
              Navigator.of(context).pushReplacement(new MaterialPageRoute(
                  builder: (BuildContext context) => new HomePage()));
              // logout(context);
            },
            // onPressed: () => Navigator.of(context).pushReplacement(
            //   new MaterialPageRoute(
            //       builder: (BuildContext context) => new AddData())),
            label: const Text('Menu'),
            icon: const Icon(Icons.logout),
            backgroundColor: Colors.blue,
          ),
          SizedBox(
            width: 20,
          ),
          //SizedBox(height: 10,),
          FloatingActionButton.extended(
            heroTag: "add valve",
            onPressed: () {
              Navigator.of(context).pushReplacement(new MaterialPageRoute(
                  builder: (BuildContext context) => new AddData()));
            },
            label: const Text('Add valve'),
            icon: const Icon(Icons.add_box),
            backgroundColor: Colors.pink,
          ),
        ],
      ),

      body: buildColisList()

      // body: new FutureBuilder<List>(
      //   future: getData(),
      //   builder: (context, snapshot) {
      //     if (snapshot.hasError) print(snapshot.error);

      //     return snapshot.hasData
      //         ? new ItemList(
      //             list: snapshot.data,
      //           )
      //         : new Center(
      //             child: new CircularProgressIndicator(),
      //           );
      //   },
      // ),
    );
  }

Column buildColisList() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          onChanged: (value) {

             setState(() {
                  });
          },
          controller: editingController,
          decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () => {
                  setState(() {
                  })
                },
                icon: Icon(Icons.clear),
              ),
              labelText: "Search",
              hintText: "Search",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)))),
        ),
      ),
      Expanded(
        child: new FutureBuilder<List>(
        future: getData(editingController.text),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
print(snapshot.data);
          return snapshot.hasData
              ? new ItemList(
                  list: snapshot.data,
                )
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
      ),
    ],
  );
}

}

class ItemList extends StatelessWidget {
  final List<Valve> list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: () =>
                Navigator.of(context).pushReplacement(new MaterialPageRoute(
                    builder: (BuildContext context) => new Detail(
                          list: list,
                          index: i,
                        ))),
            child: new Card(
              child: new ListTile(
                title: new Text(
                  list[i].fullDescription,
                  style: TextStyle(fontFamily: "Netflix"),
                ),
                leading: new Icon(Icons.widgets),
                subtitle: new Text(" Description : ${list[i].fullDescription} \n Location : ${list[i].location} \n ValveNum : ${list[i].valveNum} \n ValveType : ${list[i].valveType} \n DrainTierNum : ${list[i].drainTierNum} \n BleedTierNum : ${list[i].bleedTierNum}", ),
              ),
            ),
          ),
        );
      },
    );
  }
}
