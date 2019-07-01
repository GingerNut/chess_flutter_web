
import 'package:chess_flutter/lib/widget_library/ui_inherited_widget.dart';
import 'package:flutter_web/material.dart';
import 'package:flutter_web/widgets.dart';
import 'package:game_server/game_server.dart';

import 'main.dart';

class PieceLayer extends StatelessWidget {

  final List<Widget> pieces = new List();

  Widget build(BuildContext context) {
    var ui = UI
        .of(context)
        .ui;

    return StreamBuilder<Message>(
        stream: ui.events.stream,
        builder: (context, snapshot) {

          pieces.clear();

          (ui.position as ChessPosition).board.whiteArmy.forEach((p) {
            pieces.add(ChessPieceWidget(p, ChessColor.white));
          });

          (ui.position as ChessPosition).board.blackArmy.forEach((p) {
            pieces.add(ChessPieceWidget(p, ChessColor.black));
          });

          return Stack(

            children: pieces,

          );
        }
    );
  }

}

  class ChessPieceWidget extends StatelessWidget{
  final ChessPiece p;
  final ChessColor chessColor;

  const ChessPieceWidget(this.p,this.chessColor);


  @override
  Widget build(BuildContext context) {

    Tile t = p.tile;

  var ui = UI.of(context).ui;
  ChessInput input = ui.input;

  int tileColor = chessColor == ChessColor.white ?
      ui.theme.lightText.toInt : ui.theme.darkText.toInt;


    return Positioned(
      left: 10.0 * (7-t.i),
      top: 10.0 * t.j,

        child: IgnorePointer(
          child: RotatedBox(
            quarterTurns: input.whiteAtBottom ? 2:0,
            child: Container(
              height: 10.0,
              width: 10.0,

              child: Center(
                child: Text(
                  p.name,
                  style: TextStyle(
                    fontSize: 9,
                    color: Color(tileColor),
                  ),
                ),
              ),


            ),
          ),
        ),

    );
  }


  }



