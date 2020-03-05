import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';

void main() => runApp(MyApp());

class Lights {
  Socket socket;

  // This NEEDS to have been called before using the class, net to learn how to do this correctly
  connect() async {
    socket = await Socket.connect('192.168.1.24', 4000);
    print('Connected');
  }

  // This NEEDS to be called when exiting, close the socket connection
  close() {
    socket.close();
  }

  // Turn light on
  sendOn() async {
    // send hello
    socket.add(utf8.encode('on'));

    // wait 5 seconds
    await Future.delayed(Duration(seconds: 5));
  }

  // Turn lights off
  sendOff() async {
    // send hello
    socket.add(utf8.encode('off'));

    // wait 5 seconds
    await Future.delayed(Duration(seconds: 5));
  }
}

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
  Lights lights = new Lights();

  HomePage() {
    lights.connect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('App'),
          centerTitle: true,
          backgroundColor: Colors.red[600],
        ),
        body: Center(
          child: new ButtonBar(
            children: <Widget>[
              FlatButton(
                onPressed: () {lights.sendOn();},
                child: Text("On"),
                color: Colors.green,
              ),
              FlatButton(
                onPressed: () {lights.sendOff();},
                child: Text("Off"),
                color: Colors.red,
              ),
            ],
          )
        )
    );
  }
}
