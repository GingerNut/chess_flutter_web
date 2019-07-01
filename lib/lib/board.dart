
import 'package:chess_flutter/lib/piece_layer.dart';
import 'package:chess_flutter/lib/tile_layer.dart';
import 'package:chess_flutter/lib/widget_library/ui_inherited_widget.dart';
import 'package:flutter_web/cupertino.dart';
import 'package:game_server/game_server.dart';

import 'main.dart';



class BoardWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    var ui = UI.of(context).ui;
    ChessInput input = ui.input;

    return Expanded(

      child: Container(

        color: Color(ui.theme.background.toInt),

        child: FittedBox(

          child: RotatedBox(
            quarterTurns: input.whiteAtBottom ? 2 : 0,
            child: SizedBox(
              height: 80,
              width: 80,

              child: Stack(

                  children: [

                    TileLayer(),
                    PieceLayer(),
                  ]
              ),


            ),
          ),
        ),
      ),
    );
  }






}