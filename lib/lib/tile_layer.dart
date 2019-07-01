
import 'package:chess_flutter/lib/widget_library/ui_inherited_widget.dart';
import 'package:flutter_web/material.dart';
import 'package:flutter_web/widgets.dart';
import 'package:game_server/game_server.dart';

import 'main.dart';

class TileLayer extends StatelessWidget {

  final List<Widget> pieces = new List();

  Widget build(BuildContext context) {
    var ui = UI
        .of(context)
        .ui;

    return StreamBuilder<Message>(
        stream: ui.events.stream,
        builder: (context, snapshot) {
          pieces.clear();

          (ui.position as ChessPosition).board.tiles.forEach((t) {
            pieces.add(ChessTile(t));
          });


          return Stack(

            children: pieces,

          );
        }
    );
  }

}

  class ChessTile extends StatelessWidget{
  final Tile t;

  const ChessTile(this.t);


  @override
  Widget build(BuildContext context) {

  var ui = UI.of(context).ui;

    return StreamBuilder<Message>(
      stream: ui.events.stream,
      builder: (context, snapshot) {

        int tileColor = (t.i + t.j).isEven ?
        ui.theme.tileDark.toInt : ui.theme.tileLight.toInt;

        ChessInput input = ui.input;

        if(t == input.selected || input.legalMoves.contains(t)){
          tileColor = ui.theme.highlight.toInt;
        }

        return Positioned(
          left: 10.0 * (7-t.i),
          top: 10.0 * t.j,

          child: GestureDetector(

            onTap: (){
              (ui.input as ChessInput).tapTile(t);

            },

            child: SizedBox(
              height: 10.0,
              width: 10.0,

              child: Container(
                color: Color(tileColor),
              ),


            ),
          ),
        );
      }
    );
  }


  }



