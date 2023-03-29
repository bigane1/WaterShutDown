import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Valve.dart';
import 'listdata.dart';

class EditData extends StatefulWidget {
  final List<Valve> list;
  final int index;

  EditData({this.list, this.index});

  @override
  _EditDataState createState() => new _EditDataState();
}

class _EditDataState extends State<EditData> {
  TextEditingController controllerValveNum;
  TextEditingController controllerStandCode;
  TextEditingController controllerAreaCode;
  TextEditingController controllerLocation;
  TextEditingController controllerDrainTierNum;
  TextEditingController controllerBleedTierNum;
  TextEditingController controllerValveType;
  TextEditingController controllerTierCode;

  void editData() {
    var url = "http://localhost/WaterShutDown/restapi/editdata.php";
    http.post(url, body: {
      "id": widget.list[widget.index].id,
      "ValveNum": controllerValveNum.text,
      "AreaCode": controllerAreaCode.text,
      "StandCode": controllerStandCode.text,
      "Location": controllerLocation.text,
      "DrainTierNum": controllerDrainTierNum .text,
      "BleedTierNum": controllerBleedTierNum .text,
      "ValveType": controllerValveType.text,
      "TierCode": controllerTierCode.text
    });
  }


  @override
  void initState() {
    print(widget.list[widget.index]);
    controllerValveNum =
        new TextEditingController(text: widget.list[widget.index].valveNum );
    controllerAreaCode =
        new TextEditingController(text: widget.list[widget.index].areaCode);
    controllerStandCode =
        new TextEditingController(text: widget.list[widget.index].standCode);
    controllerLocation =
        new TextEditingController(text:   widget.list[widget.index].location);
    controllerDrainTierNum =
        new TextEditingController(text: widget.list[widget.index].drainTierNum);
    controllerBleedTierNum =
        new TextEditingController(text: widget.list[widget.index].bleedTierNum);
    controllerValveType =
        new TextEditingController(text: widget.list[widget.index].valveType);
    controllerTierCode =
        new TextEditingController(text: widget.list[widget.index].tierCode);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Edit Valve",
          style: TextStyle(fontFamily: "Netflix"),
        ),
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
                      hintText: "Valve Num", labelText: "Valve Num"),
                ),
                new TextField(
                  controller: controllerAreaCode,
                  style: TextStyle(fontFamily: "Netflix", fontSize: 15),
                  decoration: new InputDecoration(
                      hintText: "Area Code", labelText: "Area Code"),
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
                      hintText: "DrainTierNum", labelText: "DrainTierNum"),
                ),
                new TextField(
                  controller: controllerBleedTierNum,
                  style: TextStyle(fontFamily: "Netflix", fontSize: 15),
                  decoration: new InputDecoration(
                      hintText: "BleedTierNum", labelText: "BleedTierNum"),
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
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    child: new Text(
                      "EDIT Valve",
                      style:
                          TextStyle(fontFamily: "Netflix", color: Colors.white),
                    ),
                    // color: Colors.blueAccent,
                    onPressed: () {
                      //   setState(() {
                      //  });
                      editData();
                      Navigator.of(context).pushReplacement(new MaterialPageRoute(
                          builder: (BuildContext context) => new Home()));
                    },
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                  child: Text("Valves List", style: TextStyle(fontFamily: "Netflix", color: Colors.white),
                  ),
                  // color: Colors.red,
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return Home();
                    }));
                  },
                ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
