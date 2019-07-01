
import 'package:chess_flutter/lib/widget_library/flutter_dependencies.dart';
import 'package:chess_flutter/lib/widget_library/router.dart';
import 'package:flutter_web/material.dart';

import 'ui_inherited_widget.dart';

class GameApp extends StatelessWidget{

  final FlutterDependencies flutterDependencies;

  const GameApp(this.flutterDependencies);

  Widget build(BuildContext context) {

    return UI(

        MaterialApp(
            home: Scaffold(
              body: UI(

                Router(
                ),
                flutterDependencies

              ),
            ),
        ),
    flutterDependencies);
  }






}