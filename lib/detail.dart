import 'package:flutter/material.dart';
import './editdata.dart';
import 'package:http/http.dart' as http;
import 'listdata.dart';
import 'Valve.dart';

class Detail extends StatefulWidget {
  List<Valve> list;
  int index;
  Detail({this.index, this.list});
  @override
  _DetailState createState() => new _DetailState();
}

class _DetailState extends State<Detail> {
  void deleteData() {
    var url = "http://localhost/my_store/restapi/deleteData.php";
    http.post(url, body: {'id': widget.list[widget.index].id});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return Home();
    }));
    _DeleteData(context, "Valve has been deleted");
  }

  void _DeleteData(BuildContext context, String error) {
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
       resizeToAvoidBottomInset: false,
      appBar: new AppBar(
          title: new Text(
        "${widget.list[widget.index].valveNum}",
        style: TextStyle(fontFamily: "Netflix"),
      )),
      body: new Container(
        height: 1000.0,
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                new Text(
                  widget.list[widget.index].valveNum,
                  style: new TextStyle(fontFamily: "Netflix", fontSize: 20.0),
                ),
                new Text(
                  "AreaCode : ${widget.list[widget.index].areaCode}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  "StandCode : Rp. ${widget.list[widget.index].standCode}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  "Location : ${widget.list[widget.index].location}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  "ValveNum : ${widget.list[widget.index].valveNum}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  "TierCode : ${widget.list[widget.index].tierCode}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                 new Text(
                  "ValveType : ${widget.list[widget.index].valveType}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  "AreaCode :  ${widget.list[widget.index].areaCode}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  "StandCode : ${widget.list[widget.index].standCode}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                   new Text(
                  "Location : ${widget.list[widget.index].location}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                  new Text(
                  "DrainTierNum : ${widget.list[widget.index].drainTierNum}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                  new Text(
                  "BleedTierNum : ${widget.list[widget.index].bleedTierNum}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                // new Padding(
                //   padding: const EdgeInsets.only(top: 30.0),
                // ),
                new Column(
                  //mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: new ElevatedButton(
                        child: new Text(
                          "EDIT",
                          style: TextStyle(
                              fontFamily: "Netflix", color: Colors.white),
                        ),
                        // color: Colors.green,
                        onPressed: () => Navigator.of(context)
                            .pushReplacement(new MaterialPageRoute(
                          builder: (BuildContext context) => new EditData(
                            list: widget.list,
                            index: widget.index,
                          ),
                        )),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: new ElevatedButton(
                        child: new Text(
                          "DELETE",
                          style: TextStyle(
                              fontFamily: "Netflix", color: Colors.white),
                        ),
                        // color: Colors.red,
                        onPressed: () => deleteData(),
                      ),
                    ),
                  ],
                ),
                // new Padding(
                //   padding: const EdgeInsets.only(top: 30.0),
                // ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text(
                      "Valves List",
                      style: TextStyle(color: Colors.white),
                    ),
                    // color: Colors.blue,
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
          ),
        ),
      ),
    );
  }
}
