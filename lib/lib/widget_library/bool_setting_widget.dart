
import 'package:chess_flutter/lib/widget_library/ui_inherited_widget.dart';
import 'package:flutter_web/material.dart';
import 'package:game_server/game_server.dart';

class BoolSettingsWidget extends StatefulWidget{

  final String text;
  final BoolSetting setting;

  const BoolSettingsWidget(this.text, this.setting);

  @override
  _BoolSettingsWidgetState createState() => _BoolSettingsWidgetState();
}

class _BoolSettingsWidgetState extends State<BoolSettingsWidget> {

  String text;
  BoolSetting setting;

  _BoolSettingsWidgetState();

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

        Switch(
          value: setting.value,
          onChanged: (value) {
            setState(() {
              setting.value = value;
            });
          },
          activeTrackColor: Color(ui.theme.button.toInt),
          activeColor: Color(ui.theme.highlight.toInt),
        ),

        Expanded(
            child: Container()),

      ],


    );
  }
}