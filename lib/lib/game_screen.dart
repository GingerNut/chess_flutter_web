
import 'package:chess_flutter/lib/board.dart';
import 'package:chess_flutter/lib/start_screen.dart';
import 'package:chess_flutter/lib/widget_library/game_button.dart';
import 'package:chess_flutter/lib/widget_library/player_clock_widget.dart';
import 'package:chess_flutter/lib/widget_library/ui_inherited_widget.dart';
import 'package:flutter_web/cupertino.dart';
import 'package:flutter_web/material.dart';
import 'package:game_server/examples/chess/lib/chess.dart';
import 'package:game_server/game_server.dart';

class GameScreen extends StatelessWidget{
  static const String routeName = 'game';

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,

        children: <Widget>[

          StatusRow(),

          BoardWidget(),

          ButtonRow(),


        ],
      ),
    );
  }

}

class StatusRow extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    var ui = UI.of(context).ui;
    String whitePlayer = (ui.position as ChessPosition).whitePlayer;
    String blackPlayer = (ui.position as ChessPosition).blackPlayer;

    return Container(
      color: Color(ui.theme.background.toInt),
      child: Row(

        children: <Widget>[
          if(ui.game.timer) TimerCard(
            UniqueKey(),
            whitePlayer,
              40,
          Color(ui.theme.black.toInt),
          Color(ui.theme.white.toInt),
          Color(ui.theme.grey.toInt),

      ),



        Expanded(
            child: Container()
          ),

          if(ui.game.timer) TimerCard(
            UniqueKey(),
            blackPlayer,
              40,
            Color(ui.theme.white.toInt),
            Color(ui.theme.black.toInt),
            Color(ui.theme.grey.toInt),
          ),

        ],


      ),
    );
  }


}

class ButtonRow extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var ui = UI.of(context).ui;
    return Container(
      color: Color(ui.theme.background.toInt),

      child: Row(

        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: <Widget>[


          GameButton(
            Icons.home,
              (){ui.events.add(ChangeScreen(StartScreen.routeName));},
            'home'
      ),

          GameButton(
              Icons.computer,
                  () async{
                    ui.resetGame();

                    ui.addPlayer(LocalPlayer(ui));
                    ui.addPlayer(ComputerPlayer(ChessInjector()));
                    await ui.startLocalGame();

                    ui.events.add(ChangeScreen(GameScreen.routeName));

                },
              'Comp'
          ),

          GameButton(
              Icons.person,
                  () async{
                ui.resetGame();

                ui.addPlayer(LocalPlayer(ui));
                ui.addPlayer(LocalPlayer(ui));
                await ui.startLocalGame();

                ui.events.add(ChangeScreen(GameScreen.routeName));

              },
              'Human'
          ),

        ],


      ),
    );
  }




}