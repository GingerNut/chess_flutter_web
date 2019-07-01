
import 'package:chess_flutter/lib/widget_library/ui_inherited_widget.dart';
import 'package:flutter_web/material.dart';
import 'package:game_server/game_server.dart';

class Router extends StatefulWidget{

  @override
  _RouterState createState() => _RouterState();
}

class _RouterState extends State<Router> {

  Widget screen;

  Widget build(BuildContext context) {

    var routes = UI.of(context).flutterDependencies.routes;
    if(screen == null) screen = UI.of(context).flutterDependencies.home;

    return StreamBuilder<GameMessage>(

        stream: UI.of(context).ui.events.stream,
        builder: (context, snapshot) {

          if(snapshot.connectionState == ConnectionState.waiting){
            return screen;

          } else {

            GameMessage message = snapshot.data;

            if(message is ChangeScreen){

              routes.forEach((r){
                if(r.routeName == message.screen) screen = r.screen;
              });
            }


          }

          return screen;
        }
    );
  }
}