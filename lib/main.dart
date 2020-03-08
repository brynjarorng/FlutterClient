import 'package:flutter/material.dart';
import 'package:flutterapp/modules/LightController.dart';
import 'package:flutterapp/components/IPInputForm.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Title',
      home: HomePage()
    );
  }
}


class HomePage extends StatelessWidget {
  static LightController lights;

  HomePage() {
    lights = LightController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Light controller'),
          backgroundColor: Colors.red[600],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child: IPInputForm(),
            ),
            Container(
              child: null,
            )
          ],
        ),

        /*Center(
          child: new ButtonBar(
            children: <Widget>[
              RaisedButton(
                onPressed: () {lights.sendCommand("on");},
                child: Text("On"),
                color: Colors.blue,
              ),
              RaisedButton(
                onPressed: () {lights.sendCommand("off");},
                child: Text("Off"),
                color: Colors.blue,
              ),
              RaisedButton(
                onPressed: () {lights.sendCommand("blue_on");},
                child: Text("Blue on"),
                color: Colors.blue,
              ),
              RaisedButton(
                onPressed: () {lights.sendCommand("blue_off");},
                child: Text("Blue off"),
                color: Colors.blue,
              ),
              RaisedButton.icon(
                onPressed: () {lights.connect();},
                icon: Icon(
                  Icons.bluetooth_connected
                ),
                label: Text("Connect"),
                color: Colors.green,
              ),
              RaisedButton.icon(
                onPressed: () {lights.disconnect();},
                icon: Icon(
                  Icons.bluetooth_disabled
                ),
                label: Text("Disconnect"),
                color: Colors.red,
              ),
            ],
          )
        )*/
    );
  }
}
