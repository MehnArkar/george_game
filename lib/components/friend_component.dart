import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:george_game/dialog/dialog_box.dart';
import 'package:george_game/my_game.dart';

class FriendComponent extends PositionComponent with CollisionCallbacks,HasGameRef<MyGeorgeGame>{
  FriendComponent(){
    add(RectangleHitbox());
  }

@override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if(gameRef.bakegoodInventory.value>0){
      gameRef.dialog = DialogBox(text: 'Friend : Thanks for the cake, George', game: gameRef);
      gameRef.add(gameRef.dialog);
      gameRef.bakegoodInventory.value--;
    }else{
      gameRef.dialog = DialogBox(text: 'Hello! George', game: gameRef);
      gameRef.add(gameRef.dialog);
    }
  }

}