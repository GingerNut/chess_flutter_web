
import 'package:chess_flutter/lib/game_screen.dart';
import 'package:chess_flutter/lib/start_screen.dart';
import 'package:chess_flutter/lib/widget_library/flutter_dependencies.dart';
import 'package:flutter_web/src/widgets/framework.dart';
import 'package:game_server/game_server.dart';

class FlutterChess implements FlutterDependencies{

  GameDependency gameDependency = ChessInjector();

  @override
  List<Route> routes = [
    Route(
    StartScreen.routeName,
    StartScreen(),
  ),

    Route(
      GameScreen.routeName,
      GameScreen(),
    ),


  ];

  Widget get home => StartScreen();

}