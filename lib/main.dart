import 'package:flutter/material.dart';
import 'package:flutterapp/modules/LightController.dart';
import 'package:flutterapp/components/IPInputForm.dart';
import 'components/LightToggleInput.dart';

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
        body: ListView(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child: IPInputForm(),
            ),
            Container(
              child: LightToggleInput("All", "On", "on", "Off", "off", true, false),
            ),
            Container(
              child: LightToggleInput("Blue", "On", "blue_on", "Off", "blue_off", true, false),
            ),
            Container(
              child: LightToggleInput("Red", "On", "red_on", "Off", "red_off", true, false),
            ),
            Container(
              child: LightToggleInput("Green", "On", "green_on", "Off", "green_off", true, false),
            ),
            Container(
              child: LightToggleInput("Yellow", "On", "yellow_on", "Off", "yellow_off", true, false),
            ),
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
