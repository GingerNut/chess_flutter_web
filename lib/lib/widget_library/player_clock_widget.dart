import 'dart:async';

import 'package:chess_flutter/lib/widget_library/ui_inherited_widget.dart';
import 'package:flutter_web/material.dart';
import 'package:game_server/game_server.dart';

class TimerCard extends StatefulWidget{

  final String player;
  final double height;

  Color foreground;
  Color background;
  Color inactive;

  TimerCard(Key key, this.player, this.height, this.foreground, this.background, this.inactive);

  @override
  _TimerCardState createState() => _TimerCardState();
}

class _TimerCardState extends State<TimerCard> {
  double timeLeft;
  Timer timer;
  Stopwatch stopwatch = Stopwatch();
  bool inPlay = false;
  StreamController ticker = StreamController<String>();

  startClock(Position position){
      inPlay = true;
      stopwatch.reset();
      stopwatch.start();

      timer = Timer.periodic(Duration(milliseconds: 100), (t){

        double time = position.timeLeft[widget.player] - stopwatch.elapsed.inSeconds;

        ticker.add(time.toString());
      });
  }

  stopClock(Position position){
    stopwatch.stop();
    inPlay = false;
  }

  onDispose(){
    ticker.close();
  }

  @override
  Widget build(BuildContext context) {
    String text = widget.player;

    text = timeLeft.toString();

    var ui = UI.of(context).ui;
    text = ui.position.timeLeft[widget.player].toString();

    return StreamBuilder<GameMessage>(
        stream: ui.events.stream,
        builder: (context, snapshot) {

          if(snapshot.connectionState == ConnectionState.waiting){

            if(ui.position.playerId == widget.player) startClock(ui.position);


          } else if(snapshot.connectionState == ConnectionState.active){

            GameMessage message = snapshot.data;

            if(message is GameTimer){

              switch(message.instruction){
                case 'start':
                  if(ui.position.playerId == widget.player) startClock(ui.position);
                  break;

                case 'stop':
                  stopClock(ui.position);
                  text = ui.position.timeLeft[widget.player];
                  break;
              }



            }

          }

          return Container(
            height: widget.height,
            color: ui.position.playerId == widget.player ? widget.background : widget.inactive,

            child: StreamBuilder<String>(
              stream: ticker.stream,
              builder: (context, snapshot) {

                return Center(
                  child: Text(
                    snapshot.data == null ? text : snapshot.data,
                    style: TextStyle(
                      color: widget.foreground,
                      fontSize: widget.height,
                    ),
                  ),
                );
              }
            ),
          );
        }
    );;
  }
}