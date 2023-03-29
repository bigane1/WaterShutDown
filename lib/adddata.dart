import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'listdata.dart';
import 'dart:async';
import 'dart:convert';

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => new _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController controllerValveNum = new TextEditingController();
  TextEditingController controllerAreaCode = new TextEditingController();
  TextEditingController controllerStandCode = new TextEditingController();
  TextEditingController controllerLocation = new TextEditingController();

  TextEditingController controllerDrainTierNum = new TextEditingController();
  TextEditingController controllerBleedTierNum = new TextEditingController();
  TextEditingController controllerValveType = new TextEditingController();
  TextEditingController controllerTierCode = new TextEditingController();

  void addData() {
    var url = "http://localhost/WaterShutDown/restapi/adddata.php";

    http.post(url, body: {
      "ValveNum": controllerValveNum.text,
      "AreaCode": controllerAreaCode.text,
      "StandCode": controllerStandCode.text,
      "Location": controllerLocation.text,
      "DrainTierNum ": controllerDrainTierNum.text,
      "BleedTierNum ": controllerBleedTierNum.text,
      "ValveType": controllerValveType.text,
      "TierCode": controllerTierCode.text
    });
  }

  void error(BuildContext context, String error) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(error),
        action: SnackBarAction(
            label: 'OK', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Add valve", style: TextStyle(fontFamily: "Netflix"),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerValveNum,
                  style: TextStyle(fontFamily: "Netflix", fontSize: 15),
                  decoration: new InputDecoration(
                      hintText: "Valve Num",
                      hintStyle: TextStyle(fontFamily: "Netflix"),
                      labelText: "Valve Num",
                      labelStyle: TextStyle(fontFamily: "Netflix")),
                ),
                new TextField(
                  controller: controllerAreaCode,
                  style: TextStyle(fontFamily: "Netflix", fontSize: 15),
                  decoration: new InputDecoration(
                      hintText: "Area Code",
                      hintStyle: TextStyle(fontFamily: "Netflix"),
                      labelText: "Area Code"),
                ),
                new TextField(
                  controller: controllerStandCode,
                  style: TextStyle(fontFamily: "Netflix", fontSize: 15),
                  decoration: new InputDecoration(
                      hintText: "Stand Code", labelText: "Stand Code"),
                ),
                new TextField(
                  controller: controllerLocation,
                  style: TextStyle(fontFamily: "Netflix", fontSize: 15),
                  decoration: new InputDecoration(
                      hintText: "Location", labelText: "Location"),
                ),
               new TextField(
                  controller: controllerDrainTierNum,
                  style: TextStyle(fontFamily: "Netflix", fontSize: 15),
                  decoration: new InputDecoration(
                      hintText: "Drain TierNum", labelText: "Drain TierNum"),
                ),
                new TextField(
                  controller: controllerBleedTierNum,
                  style: TextStyle(fontFamily: "Netflix", fontSize: 15),
                  decoration: new InputDecoration(
                      hintText: "Bleed TierNum", labelText: "Bleed TierNum"),
                ),
                new TextField(
                  controller: controllerValveType,
                  style: TextStyle(fontFamily: "Netflix", fontSize: 15),
                  decoration: new InputDecoration(
                      hintText: "ValveType", labelText: "ValveType"),
                ),
                 new TextField(
                  controller: controllerTierCode,
                  style: TextStyle(fontFamily: "Netflix", fontSize: 15),
                  decoration: new InputDecoration(
                      hintText: "TierCode", labelText: "TierCode"),
                ),
                Column(
                  children: <Widget>[
                    Container(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          //Navigator.pop(context);
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return Home();
                          }));
                          // Navigator.of(context).pushReplacement(new MaterialPageRoute(
                          //     builder: (BuildContext context) => new Home()));
                        },
                        child: new Text("Valves list", style: TextStyle(color: Colors.white),),
                        // color: Colors.blueAccent,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                         addData();
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return Home();
                            }));

                          // Navigator.of(context).pushReplacement(new MaterialPageRoute(
                          //     builder: (BuildContext context) => new Home()));
                        },
                        child: new Text(
                          "Add Data",
                          style: TextStyle(color: Colors.white),
                        ),
                        // color: Colors.pink,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
