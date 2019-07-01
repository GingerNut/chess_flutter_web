
import 'package:chess_flutter/lib/widget_library/ui_inherited_widget.dart';
import 'package:flutter_web/material.dart';
import 'package:flutter_web/widgets.dart';

class GameButton extends StatefulWidget{

  IconData icon;
  Function onPressed;
  String text;

  GameButton(
      this.icon,
      this.onPressed,
      this.text
      );

  @override
  _GameButtonState createState() => _GameButtonState();
}

class _GameButtonState extends State<GameButton> {

  Widget build(BuildContext context) {

    var ui = UI.of(context).ui;

    // TODO: implement build
    return  Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(80.0),
          child: RaisedButton(
            color: Color(ui.theme.button.toInt),

            onPressed: widget.onPressed,
            child: Column(
                children: [
                  Text(
                      widget.text,
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(ui.theme.lightText.toInt)
            )
                  ),

                  Icon(
                    widget.icon,
                    color: Color(ui.theme.lightText.toInt),
                  ),
              ]
            )

            ,
          ),
        ),
      ),
    );
  }
}

