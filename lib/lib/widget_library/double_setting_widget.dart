

import 'package:chess_flutter/lib/widget_library/ui_inherited_widget.dart';
import 'package:flutter_web/material.dart';
import 'package:game_server/game_server.dart';

class DoubleSettingsWidget extends StatefulWidget{

  final String text;
  final DoubleSetting setting;

  const DoubleSettingsWidget(this.text, this.setting);

  @override
  _DoubleSettingsWidgetState createState() => _DoubleSettingsWidgetState();
}

class _DoubleSettingsWidgetState extends State<DoubleSettingsWidget> {

  String text;
  DoubleSetting setting;

  _DoubleSettingsWidgetState();

  TextEditingController controller = TextEditingController();

  initState(){
    text = widget.text;
    setting = widget.setting;
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    var ui = UI.of(context).ui;

    return Row(

      mainAxisAlignment: MainAxisAlignment.center,

      children: <Widget>[

        Expanded(
            child: Container()),

        Text(
          text,

          style: TextStyle(
              fontSize: 40,
              color: Color(ui.theme.lightText.toInt)

          ),


        ),

        Expanded(
            child: Container()),

        Container(
          width : 120,
          child: TextField(
           controller: controller..addListener((){
             setState(() {
               setting.value = double.parse(controller.text);
             });
           }),

            style: TextStyle(
              fontSize: 40,
              color: Color(ui.theme.lightText.toInt)
            ),

            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: setting.value.truncate().toString(),
                hintStyle: TextStyle(
                    fontSize: 40,
                    color: Color(ui.theme.lightText.toInt)
                ),
            ),

          ),
        ),

        Expanded(
            child: Container()),

      ],


    );
  }
}

