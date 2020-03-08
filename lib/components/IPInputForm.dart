import 'package:flutter/material.dart';
import 'package:flutterapp/main.dart';
import 'package:flutterapp/styling/styling.dart';

class IPInputForm extends StatefulWidget {
  @override
  IPInputFormState createState() {
    return IPInputFormState();
  }
}

class IPInputFormState extends State<IPInputForm> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: mainBoxDecoration(),
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Column (
        children: <Widget>[
          Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: TextFormField(
                controller: myController,
                decoration: InputDecoration(
                    labelText: 'Enter IP of Light Controller'
                ),
              )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  child: RaisedButton.icon(
                    onPressed: () {
                      if (myController.text.length > 0) {
                        HomePage.lights.connect(ip: myController.text);
                      } else {
                        HomePage.lights.connect();
                      }
                    },
                    icon: Icon(
                        Icons.bluetooth_connected
                    ),
                    label: Text("Connect"),
                    color: Colors.green,
                  )
              ),
              Container(
                child: RaisedButton.icon(
                  onPressed: () {HomePage.lights.disconnect();},
                  icon: Icon(
                      Icons.bluetooth_disabled
                  ),
                  label: Text("Disconnect"),
                  color: Colors.red,
                ),
              )
            ],
          )
        ]
      )
    );
  }
}