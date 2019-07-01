
import 'package:chess_flutter/lib/widget_library/flutter_dependencies.dart';
import 'package:flutter_web/material.dart';
import 'package:game_server/game_server.dart';

class UI extends InheritedWidget{

  final FlutterDependencies flutterDependencies;
  final LocalInterface  ui;
  final Widget child;

  UI(this.child, this.flutterDependencies): ui = LocalInterface(flutterDependencies.gameDependency);

  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static UI of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(UI);

}