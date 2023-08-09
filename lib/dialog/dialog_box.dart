import 'dart:ui';

import 'package:flame/components.dart';
import 'package:george_game/my_game.dart';

class DialogBox extends TextBoxComponent {
  final MyGeorgeGame game;
  DialogBox({required String text,required this.game}):super(
    text:text,
    position: game.size,
    boxConfig: TextBoxConfig(
      dismissDelay: 5,
      maxWidth: 500,
      timePerChar: 0.1,
    )
  ){
      anchor = Anchor.centerLeft;
  }


  @override
  void drawBackground(Canvas c) {
    Rect rect = Rect.fromLTWH(0, 0, width, height);
    c.drawRect(
        rect,
        Paint()
        ..color = Color(0x8f37474f)
    );

  }

  @override
  void update(double dt) {
    super.update(dt);
    if(finished){
      game.remove(this);
    }
  }
}