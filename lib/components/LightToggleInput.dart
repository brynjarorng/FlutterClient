import 'package:flutter/material.dart';
import 'package:flutterapp/styling/styling.dart';
import 'package:flutterapp/main.dart';

class LightToggleInput extends StatefulWidget {
  final String moduleDesc;
  final String leftButtonText;
  final String leftButtonCommand;
  final String rightButtonText;
  final String rightButtonCommand;
  bool leftActive;
  bool rightActive;

  LightToggleInput(this.moduleDesc, this.leftButtonText, this.leftButtonCommand, this.rightButtonText, this.rightButtonCommand, this.leftActive, this.rightActive);

  @override
  State<StatefulWidget> createState() {
    print(leftButtonCommand);
    return LightToggleInputState(moduleDesc, leftButtonText, leftButtonCommand, rightButtonText, rightButtonCommand, leftActive, rightActive);
  }
}

class LightToggleInputState extends State<LightToggleInput> {
  final String moduleDesc;
  final String leftButtonText;
  final String leftButtonCommand;
  final String rightButtonText;
  final String rightButtonCommand;
  bool leftActive = false;
  Color leftColor;
  bool rightActive = false;
  Color rightColor;

  LightToggleInputState(this.moduleDesc, this.leftButtonText, this.leftButtonCommand, this.rightButtonText, this.rightButtonCommand, this.leftActive, this.rightActive);

  void selectBtnColors() {
    setState(() {
      // left btn
      if(leftActive != null && leftActive) {
        leftColor = Colors.orange[700];
      } else {
        leftColor = Colors.grey;
      }

      // Right btn
      if(rightActive != null && rightActive) {
        rightColor = Colors.orange[700];
      } else {
        rightColor = Colors.grey;
      }
    });
  }

  void handleLeftButton() {
    HomePage.lights.sendCommand(leftButtonCommand);
    setState(() {
      leftActive = true;
      rightActive = false;
    });
    selectBtnColors();
  }

  void handleRightButton() {
    HomePage.lights.sendCommand(rightButtonCommand);
    setState(() {
      leftActive = false;
      rightActive = true;
    });
    selectBtnColors();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: mainBoxDecoration(),
        margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Column (
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              child: Text(moduleDesc),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {handleLeftButton();},
                  child: Text(leftButtonText),
                  color: leftColor,
                ),
                RaisedButton(
                  onPressed: () {handleRightButton();},
                  child: Text(rightButtonText),
                  color: rightColor,
                ),
              ],
            )
          ],
        )
    );
  }
}