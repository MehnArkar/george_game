import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:george_game/widget/button_controller.dart';
import 'my_game.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  MyGeorgeGame game = MyGeorgeGame();
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: GameWidget(
              game: game,
            overlayBuilderMap: {
                'button_controller':(context,MyGeorgeGame game)=>ButtonController(game: game),
            },
          )
      )
      )
  );
}



