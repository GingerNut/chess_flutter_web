import 'package:flutter_web/widgets.dart';
import 'package:game_server/game_server.dart';

abstract class FlutterDependencies{

  GameDependency gameDependency;

  List<Route> routes;

  Widget get home;

}

class Route{

  final String routeName;
  final Widget screen;

  Route(this.routeName, this.screen);

}